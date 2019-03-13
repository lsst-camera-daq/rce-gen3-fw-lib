-- (c) Copyright 1995-2018 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:ip:gmii_to_rgmii:4.0
-- IP Revision: 6

-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT GmiiToRgmiiCore
  PORT (
    tx_reset : IN STD_LOGIC;
    rx_reset : IN STD_LOGIC;
    clkin : IN STD_LOGIC;
    ref_clk_out : OUT STD_LOGIC;
    mmcm_locked_out : OUT STD_LOGIC;
    gmii_clk_125m_out : OUT STD_LOGIC;
    gmii_clk_25m_out : OUT STD_LOGIC;
    gmii_clk_2_5m_out : OUT STD_LOGIC;
    rgmii_txd : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    rgmii_tx_ctl : OUT STD_LOGIC;
    rgmii_txc : OUT STD_LOGIC;
    rgmii_rxd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    rgmii_rx_ctl : IN STD_LOGIC;
    rgmii_rxc : IN STD_LOGIC;
    link_status : OUT STD_LOGIC;
    clock_speed : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    duplex_status : OUT STD_LOGIC;
    mdio_gem_mdc : IN STD_LOGIC;
    mdio_gem_i : OUT STD_LOGIC;
    mdio_gem_o : IN STD_LOGIC;
    mdio_gem_t : IN STD_LOGIC;
    mdio_phy_mdc : OUT STD_LOGIC;
    mdio_phy_i : IN STD_LOGIC;
    mdio_phy_o : OUT STD_LOGIC;
    mdio_phy_t : OUT STD_LOGIC;
    gmii_txd : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    gmii_tx_en : IN STD_LOGIC;
    gmii_tx_er : IN STD_LOGIC;
    gmii_tx_clk : OUT STD_LOGIC;
    gmii_crs : OUT STD_LOGIC;
    gmii_col : OUT STD_LOGIC;
    gmii_rxd : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    gmii_rx_dv : OUT STD_LOGIC;
    gmii_rx_er : OUT STD_LOGIC;
    gmii_rx_clk : OUT STD_LOGIC;
    speed_mode : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : GmiiToRgmiiCore
  PORT MAP (
    tx_reset => tx_reset,
    rx_reset => rx_reset,
    clkin => clkin,
    ref_clk_out => ref_clk_out,
    mmcm_locked_out => mmcm_locked_out,
    gmii_clk_125m_out => gmii_clk_125m_out,
    gmii_clk_25m_out => gmii_clk_25m_out,
    gmii_clk_2_5m_out => gmii_clk_2_5m_out,
    rgmii_txd => rgmii_txd,
    rgmii_tx_ctl => rgmii_tx_ctl,
    rgmii_txc => rgmii_txc,
    rgmii_rxd => rgmii_rxd,
    rgmii_rx_ctl => rgmii_rx_ctl,
    rgmii_rxc => rgmii_rxc,
    link_status => link_status,
    clock_speed => clock_speed,
    duplex_status => duplex_status,
    mdio_gem_mdc => mdio_gem_mdc,
    mdio_gem_i => mdio_gem_i,
    mdio_gem_o => mdio_gem_o,
    mdio_gem_t => mdio_gem_t,
    mdio_phy_mdc => mdio_phy_mdc,
    mdio_phy_i => mdio_phy_i,
    mdio_phy_o => mdio_phy_o,
    mdio_phy_t => mdio_phy_t,
    gmii_txd => gmii_txd,
    gmii_tx_en => gmii_tx_en,
    gmii_tx_er => gmii_tx_er,
    gmii_tx_clk => gmii_tx_clk,
    gmii_crs => gmii_crs,
    gmii_col => gmii_col,
    gmii_rxd => gmii_rxd,
    gmii_rx_dv => gmii_rx_dv,
    gmii_rx_er => gmii_rx_er,
    gmii_rx_clk => gmii_rx_clk,
    speed_mode => speed_mode
  );
-- INST_TAG_END ------ End INSTANTIATION Template ---------

-- You must compile the wrapper file GmiiToRgmiiCore.vhd when simulating
-- the core, GmiiToRgmiiCore. When compiling the wrapper file, be sure to
-- reference the VHDL simulation library.

