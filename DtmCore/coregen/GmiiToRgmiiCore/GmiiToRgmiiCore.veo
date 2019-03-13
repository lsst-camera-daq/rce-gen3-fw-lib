// (c) Copyright 1995-2018 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.

// IP VLNV: xilinx.com:ip:gmii_to_rgmii:4.0
// IP Revision: 6

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
GmiiToRgmiiCore your_instance_name (
  .tx_reset(tx_reset),                    // input wire tx_reset
  .rx_reset(rx_reset),                    // input wire rx_reset
  .clkin(clkin),                          // input wire clkin
  .ref_clk_out(ref_clk_out),              // output wire ref_clk_out
  .mmcm_locked_out(mmcm_locked_out),      // output wire mmcm_locked_out
  .gmii_clk_125m_out(gmii_clk_125m_out),  // output wire gmii_clk_125m_out
  .gmii_clk_25m_out(gmii_clk_25m_out),    // output wire gmii_clk_25m_out
  .gmii_clk_2_5m_out(gmii_clk_2_5m_out),  // output wire gmii_clk_2_5m_out
  .rgmii_txd(rgmii_txd),                  // output wire [3 : 0] rgmii_txd
  .rgmii_tx_ctl(rgmii_tx_ctl),            // output wire rgmii_tx_ctl
  .rgmii_txc(rgmii_txc),                  // output wire rgmii_txc
  .rgmii_rxd(rgmii_rxd),                  // input wire [3 : 0] rgmii_rxd
  .rgmii_rx_ctl(rgmii_rx_ctl),            // input wire rgmii_rx_ctl
  .rgmii_rxc(rgmii_rxc),                  // input wire rgmii_rxc
  .link_status(link_status),              // output wire link_status
  .clock_speed(clock_speed),              // output wire [1 : 0] clock_speed
  .duplex_status(duplex_status),          // output wire duplex_status
  .mdio_gem_mdc(mdio_gem_mdc),            // input wire mdio_gem_mdc
  .mdio_gem_i(mdio_gem_i),                // output wire mdio_gem_i
  .mdio_gem_o(mdio_gem_o),                // input wire mdio_gem_o
  .mdio_gem_t(mdio_gem_t),                // input wire mdio_gem_t
  .mdio_phy_mdc(mdio_phy_mdc),            // output wire mdio_phy_mdc
  .mdio_phy_i(mdio_phy_i),                // input wire mdio_phy_i
  .mdio_phy_o(mdio_phy_o),                // output wire mdio_phy_o
  .mdio_phy_t(mdio_phy_t),                // output wire mdio_phy_t
  .gmii_txd(gmii_txd),                    // input wire [7 : 0] gmii_txd
  .gmii_tx_en(gmii_tx_en),                // input wire gmii_tx_en
  .gmii_tx_er(gmii_tx_er),                // input wire gmii_tx_er
  .gmii_tx_clk(gmii_tx_clk),              // output wire gmii_tx_clk
  .gmii_crs(gmii_crs),                    // output wire gmii_crs
  .gmii_col(gmii_col),                    // output wire gmii_col
  .gmii_rxd(gmii_rxd),                    // output wire [7 : 0] gmii_rxd
  .gmii_rx_dv(gmii_rx_dv),                // output wire gmii_rx_dv
  .gmii_rx_er(gmii_rx_er),                // output wire gmii_rx_er
  .gmii_rx_clk(gmii_rx_clk),              // output wire gmii_rx_clk
  .speed_mode(speed_mode)                // output wire [1 : 0] speed_mode
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

// You must compile the wrapper file GmiiToRgmiiCore.v when simulating
// the core, GmiiToRgmiiCore. When compiling the wrapper file, be sure to
// reference the Verilog simulation library.

