
if { [get_drc_checks -quiet {iock-1}] == "" } {
  proc standardCheck {} {
      # list to hold violations
      set vios {}
      # iterate through the objects to be checked
      foreach rgmii [get_ports rgmii_*] {
        set standard [get_property IOSTANDARD $rgmii]
	set List_of_valid_standards {LVCMOS25 LVCMOS18 LVCMOS15 LVDCI_18 LVDCI_15 HSLVDCI_18 HSLVDCI_15 LVDCI_DV2_18 LVDCI_DV2_15 HSTL_I HSTL_II HSTL_I_DCI HSTL_II_DCI HSTL_II_T_DCI HSTL_I_18 HSTL_II_18 HSTL_I_DCI_18 HSTL_II_DCI_18 HSTL_II_T_DCI_18}
        if { [lsearch -nocase $List_of_valid_standards $standard ] < 0} {
          # define the message to report when violations are found
          set msg "On cell %ELG, IOSTANDARD  is $standard"
          send_msg_id "IO_STD_Check-01" "WARNING" "On Port $rgmii, IOSTANDARD  is $standard, this port supports only 2.5v or less"
          set vio [ create_drc_violation -name {iock-1} -msg $msg $rgmii ]
          lappend vios $vio
        }
      }
      if {[llength $vios] > 0} {
        return -code error $vios
      } else {
        return {}
      }
    }
    create_drc_check -name {iock-1} \
                     -hiername {IOSTANDARD Checks} \
                     -desc {IOSTANDARD Check} \
                     -rule_body standardCheck

    report_drc -check {iock-1}
}
