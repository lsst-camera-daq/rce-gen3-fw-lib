-------------------------------------------------------------------------------
-- Title         : ARM Based RCE Generation 3, Top Level
-- File          : RceG3Top.vhd
-- Author        : Ryan Herbst, rherbst@slac.stanford.edu
-- Created       : 04/02/2013
-------------------------------------------------------------------------------
-- Description:
-- Top level file for ARM based rce generation 3 processor core.
-------------------------------------------------------------------------------
-- Copyright (c) 2013 by Ryan Herbst. All rights reserved.
-------------------------------------------------------------------------------
-- Modification history:
-- 04/02/2013: created.
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

use work.RceG3Pkg.all;
use work.StdRtlPkg.all;
use work.AxiLitePkg.all;
use work.AxiPkg.all;

entity RceG3Top is
   generic (
      TPD_G                 : time                  := 1 ns;
      DMA_CLKDIV_G          : real                  := 4.7;
      RCE_DMA_COUNT_G       : integer range 1 to 16 := 1;
      RCE_DMA_AXIS_CONFIG_G : AxiStreamConfigType   := AXI_STREAM_CONFIG_INIT_G;
      RCE_DMA_MODE_G        : RceDmaModeArray(RCE_DMA_COUNT_G-1 downto 0)
   );
   port (

      -- I2C
      i2cSda                   : inout sl;
      i2cScl                   : inout sl;

      -- Clocks
      sysClk125                : out   sl;
      sysClk125Rst             : out   sl;
      sysClk200                : out   sl;
      sysClk200Rst             : out   sl;

      -- External Axi Bus, 0xA0000000 - 0xBFFFFFFF
      axiClk                   : out   sl;
      axiClkRst                : out   sl;
      extAxilReadMaster        : out   AxiLiteReadMasterType;
      extAxilReadSlave         : in    AxiLiteReadSlaveType;
      extAxilWriteMaster       : out   AxiLiteWriteMasterType;
      extAxilWriteSlave        : in    AxiLiteWriteSlaveType;

      -- DMA Interfaces
      dmaClk                   : in    slv(RCE_DMA_COUNT_G-1 downto 0);
      dmaClkRst                : in    slv(RCE_DMA_COUNT_G-1 downto 0);
      dmaOnline                : out   slv(RCE_DMA_COUNT_G-1 downto 0);
      dmaEnable                : out   slv(RCE_DMA_COUNT_G-1 downto 0);
      dmaObMaster              : out   AxiStreamMasterArray(RCE_DMA_COUNT_G-1 downto 0);
      dmaObSlave               : in    AxiStreamSlaveArray(RCE_DMA_COUNT_G-1 downto 0);
      dmaIbMaster              : in    AxiStreamMasterArray(RCE_DMA_COUNT_G-1 downto 0);
      dmaIbSlave               : out   AxiStreamSlaveArray(RCE_DMA_COUNT_G-1 downto 0);

      -- Ethernet
      armEthTx                 : out   ArmEthTxArray(1 downto 0);
      armEthRx                 : in    ArmEthRxArray(1 downto 0)

      -- Programmable Clock Select
      clkSelA                  : out   slv(1 downto 0);
      clkSelB                  : out   slv(1 downto 0)
   );
end RceG3Top;

architecture structure of RceG3Top is

   -- Local signals
   signal fclkClk3            : sl;
   signal fclkClk2            : sl;
   signal fclkClk1            : sl;
   signal fclkClk0            : sl;
   signal fclkRst3            : sl;
   signal fclkRst2            : sl;
   signal fclkRst1            : sl;
   signal fclkRst0            : sl;
   signal sysClk125           : sl;
   signal sysClk125Rst        : sl;
   signal sysClk200           : sl;
   signal sysClk200Rst        : sl;
   signal axiDmaClk           : sl;
   signal axiDmaRst           : sl;
   signal armInt              : slv(15 downto 0);
   signal mGpWriteMaster      : AxiWriteMasterArray(1 downto 0);
   signal mGpWriteSlave       : AxiWriteSlaveArray(1 downto 0);
   signal mGpReadMaster       : AxiReadMasterArray(1 downto 0);
   signal mGpReadSlave        : AxiReadSlaveArray(1 downto 0);
   signal acpWriteSlave       : AxiWriteSlaveType;
   signal acpWriteMaster      : AxiWriteMasterType;
   signal acpReadSlave        : AxiReadSlaveType;
   signal acpReadMaster       : AxiReadMasterType;
   signal hpWriteSlave        : AxiWriteSlaveArray(3 downto 0);
   signal hpWriteMaster       : AxiWriteMasterArray(3 downto 0);
   signal hpReadSlave         : AxiReadSlaveArray(3 downto 0);
   signal hpReadMaster        : AxiReadMasterArray(3 downto 0);
   signal dmaAxilReadMaster   : AxiLiteReadMasterType;
   signal dmaAxilReadSlave    : AxiLiteReadSlaveType;
   signal dmaAxilWriteMaster  : AxiLiteWriteMasterType;
   signal dmaAxilWriteSlave   : AxiLiteWriteSlaveType;
   signal bsiAxilReadMaster   : AxiLiteReadMasterArray(1 downto 0);
   signal bsiAxilReadSlave    : AxiLiteReadSlaveArray(1 downto 0);
   signal bsiAxilWriteMaster  : AxiLiteWriteMasterArray(1 downto 0);
   signal bsiAxilWriteSlave   : AxiLiteWriteSlaveArray(1 downto 0);

begin

   --------------------------------------------
   -- Processor Core
   --------------------------------------------
   U_RceG3Cpu : entity work.RceG3Cpu 
      generic map (
         TPD_G => TPD_G
      ) port map (
         fclkClk3             => fclkClk3,
         fclkClk2             => fclkClk2,
         fclkClk1             => fclkClk1,
         fclkClk0             => fclkClk0,
         fclkRst3             => fclkRst3,
         fclkRst2             => fclkRst2,
         fclkRst1             => fclkRst1,
         fclkRst0             => fclkRst0,
         armInt               => armInt,
         mGpAxiClk(0)         => axiDmaClk,
         mGpAxiClk(1)         => isysClk125,
         mGpWriteMaster       => mGpWriteMaster,
         mGpWriteSlave        => mGpWriteSlave,
         mGpReadMaster        => mGpReadMaster,
         mGpReadSlave         => mGpReadSlave,
         sGpAxiClk            => axiDmaClk,
         sGpWriteSlave        => open,
         sGpWriteMaster       => (other=>AXI_WRITE_MASTER_INIT_C),
         sGpReadSlave         => open,
         sGpReadMaster        => (other=>AXI_READ_MASTER_INIT_C),
         acpAxiClk            => axiDmaClk,
         acpWriteSlave        => acpWriteSlave,
         acpWriteMaster       => acpWriteMaster,
         acpReadSlave         => acpReadSlave,
         acpReadMaster        => acpReadMaster,
         hpAxiClk             => axiDmaClk,
         hpWriteSlave         => hpWriteSlave,
         hpWriteMaster        => hpWriteMaster,
         hpReadSlave          => hpReadSlave,
         hpReadMaster         => hpReadMaster,
         armEthTx             => armEthTx,
         armEthRx             => armEthRx
      );


   --------------------------------------------
   -- Clock Generation
   --------------------------------------------
   U_RceG3Clocks: entity work.RceG3Clocks
      generic map (
         TPD_G        => TPD_G,
         AXI_CLKDIV_G => AXI_CLKDIV_G
      ) port map (
         fclkClk3                 => fclkClk3,
         fclkClk2                 => fclkClk2,
         fclkClk1                 => fclkClk1,
         fclkClk0                 => fclkClk0,
         fclkRst3                 => fclkRst3,
         fclkRst2                 => fclkRst2,
         fclkRst1                 => fclkRst1,
         fclkRst0                 => fclkRst0,
         axiDmaClk                => axiDmaClk,
         axiDmaRst                => axiDmaRst,
         sysClk125                => isysClk125,
         sysClk125Rst             => isysClk125Rst,
         sysClk200                => isysClk200,
         sysClk200Rst             => isysClk200Rst
      );

   -- Output clocks
   sysClk125    <= isysClk125;
   sysClk125Rst <= isysClk125Rst;
   sysClk200    <= isysClk200;
   sysClk200Rst <= isysClk200Rst;
   axiClk       <= isysClk125,
   axiClkRst    <= isysClk125Rst;

   --------------------------------------------
   -- AXI Lite Bus
   --------------------------------------------
   U_RceG3LocalAxi: entity work.RceG3LocalAxi 
      generic map (
         TPD_G => TPD_G
      ) port map (
         axiClk               => isysClk125,
         axiRst               => isysClk125Rst,
         axiDmaClk            => axiDmaClk,
         axiDmaRst            => axiDmaRst,
         mGpReadMaster        => mGpReadMaster,
         mGpReadSlave         => mGpReadSlave,
         mGpWriteMaster       => mGpWriteMaster,
         mGpWriteSlave        => mGpWriteSlave,
         dmaAxilReadMaster    => dmaAxilReadMaster,
         dmaAxilReadSlave     => dmaAxilReadSlave,
         dmaAxilWriteMaster   => dmaAxilWriteMaster,
         dmaAxilWriteSlave    => dmaAxilWriteSlave,
         bsiAxilReadMaster    => bsiAxilReadMaster,
         bsiAxilReadSlave     => bsiAxilReadSlave,
         bsiAxilWriteMaster   => bsiAxilWriteMaster,
         bsiAxilWriteSlave    => bsiAxilWriteSlave,
         extAxilReadMaster    => extAxilReadMaster,
         extAxilReadSlave     => extAxilReadSlave,
         extAxilWriteMaster   => extAxilWriteMaster,
         extAxilWriteSlave    => extAxilWriteSlave,
         clkSelA              => clkSelA,
         clkSelB              => clkSelB
      );


   --------------------------------------------
   -- BSI Controller
   --------------------------------------------
   U_RceG3I2c : entity work.RceG3I2c
      generic map (
         TPD_G => TPD_G
      ) port map (
         axiClk           => isysClk125,
         axiClkRst        => isysClk125Rst,
         axilReadMaster   => bsiAxilReadMaster,
         axilReadSlave    => bsiAxilReadSlave,
         axilWriteMaster  => bsiAxilWriteMaster,
         axilWriteSlave   => bsiAxilWriteSlave,
         acpWriteMaster   => acpWriteMaster,
         acpWriteSlave    => acpWriteSlave,
         i2cSda           => i2cSda,
         i2cScl           => i2cScl
      );


   --------------------------------------------
   -- DMA Controller
   --------------------------------------------
   U_RceG3Dma: entity work.RceG3Dma 
      generic map (
         TPD_G                 => TPD_G,
         AXIL_BASE_ADDR_G      => x"40000000",
         RCE_DMA_COUNT_G       => RCE_DMA_COUNT_G,
         RCE_DMA_AXIS_CONFIG_G => RCE_DMA_AXIS_CONFIG_G,
         RCE_DMA_MODE_G        => RCE_DMA_MODE_G
      ) port map (
         axiDmaClk            => axiDmaClk,
         axiDmaRst            => axiDmaRst,
         --acpWriteSlave        => acpWriteSlave,
         --acpWriteMaster       => acpWriteMaster,
         acpWriteSlave        => AXI_WRITE_SLAVE_INIT_C,
         acpWriteMaster       => open,
         acpReadSlave         => acpReadSlave,
         acpReadMaster        => acpReadMaster,
         hpWriteSlave         => hpWriteSlave,
         hpWriteMaster        => hpWriteMaster,
         hpReadSlave          => hpReadSlave,
         hpReadMaster         => hpReadMaster,
         axilReadMaster       => dmaAxilReadMaster,
         axilReadSlave        => dmaAxilReadSlave,
         axilWriteMaster      => dmaAxilWriteMaster,
         axilWriteSlave       => dmaAxilWriteSlave,
         interrupt            => armInt,
         dmaClk               => dmaClk,
         dmaClkRst            => dmaClkRst,
         dmaOnline            => dmaOnline,
         dmaEnable            => dmaEnable,
         dmaObMaster          => dmaObMaster,
         dmaObSlave           => dmaObSlave,
         dmaIbMaster          => dmaIbMaster,
         dmaIbSlave           => dmaIbSlave
      );

end architecture structure;

