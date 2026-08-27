# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "C_S00_AXI_DATA_WIDTH" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "C_S00_AXI_ADDR_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S00_AXI_BASEADDR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S00_AXI_HIGHADDR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "GLOBAL_DATE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "GLOBAL_TIME" -parent ${Page_0}
  ipgui::add_param $IPINST -name "GLOBAL_VER" -parent ${Page_0}
  ipgui::add_param $IPINST -name "GLOBAL_SHA" -parent ${Page_0}
  ipgui::add_param $IPINST -name "TOP_SHA" -parent ${Page_0}
  ipgui::add_param $IPINST -name "TOP_VER" -parent ${Page_0}
  ipgui::add_param $IPINST -name "CON_SHA" -parent ${Page_0}
  ipgui::add_param $IPINST -name "CON_VER" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HOG_SHA" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HOG_VER" -parent ${Page_0}
  ipgui::add_param $IPINST -name "XML_SHA" -parent ${Page_0}
  ipgui::add_param $IPINST -name "XML_VER" -parent ${Page_0}
  ipgui::add_param $IPINST -name "MYLIB0_VER" -parent ${Page_0}
  ipgui::add_param $IPINST -name "MYLIB0_SHA" -parent ${Page_0}
  ipgui::add_param $IPINST -name "MYLIB1_VER" -parent ${Page_0}
  ipgui::add_param $IPINST -name "MYLIB1_SHA" -parent ${Page_0}
  ipgui::add_param $IPINST -name "MYEXTLIB_SHA" -parent ${Page_0}
  ipgui::add_param $IPINST -name "FLAVOUR" -parent ${Page_0}


}

proc update_PARAM_VALUE.CON_SHA { PARAM_VALUE.CON_SHA } {
	# Procedure called to update CON_SHA when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CON_SHA { PARAM_VALUE.CON_SHA } {
	# Procedure called to validate CON_SHA
	return true
}

proc update_PARAM_VALUE.CON_VER { PARAM_VALUE.CON_VER } {
	# Procedure called to update CON_VER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CON_VER { PARAM_VALUE.CON_VER } {
	# Procedure called to validate CON_VER
	return true
}

proc update_PARAM_VALUE.FLAVOUR { PARAM_VALUE.FLAVOUR } {
	# Procedure called to update FLAVOUR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FLAVOUR { PARAM_VALUE.FLAVOUR } {
	# Procedure called to validate FLAVOUR
	return true
}

proc update_PARAM_VALUE.GLOBAL_DATE { PARAM_VALUE.GLOBAL_DATE } {
	# Procedure called to update GLOBAL_DATE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.GLOBAL_DATE { PARAM_VALUE.GLOBAL_DATE } {
	# Procedure called to validate GLOBAL_DATE
	return true
}

proc update_PARAM_VALUE.GLOBAL_SHA { PARAM_VALUE.GLOBAL_SHA } {
	# Procedure called to update GLOBAL_SHA when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.GLOBAL_SHA { PARAM_VALUE.GLOBAL_SHA } {
	# Procedure called to validate GLOBAL_SHA
	return true
}

proc update_PARAM_VALUE.GLOBAL_TIME { PARAM_VALUE.GLOBAL_TIME } {
	# Procedure called to update GLOBAL_TIME when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.GLOBAL_TIME { PARAM_VALUE.GLOBAL_TIME } {
	# Procedure called to validate GLOBAL_TIME
	return true
}

proc update_PARAM_VALUE.GLOBAL_VER { PARAM_VALUE.GLOBAL_VER } {
	# Procedure called to update GLOBAL_VER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.GLOBAL_VER { PARAM_VALUE.GLOBAL_VER } {
	# Procedure called to validate GLOBAL_VER
	return true
}

proc update_PARAM_VALUE.HOG_SHA { PARAM_VALUE.HOG_SHA } {
	# Procedure called to update HOG_SHA when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HOG_SHA { PARAM_VALUE.HOG_SHA } {
	# Procedure called to validate HOG_SHA
	return true
}

proc update_PARAM_VALUE.HOG_VER { PARAM_VALUE.HOG_VER } {
	# Procedure called to update HOG_VER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HOG_VER { PARAM_VALUE.HOG_VER } {
	# Procedure called to validate HOG_VER
	return true
}

proc update_PARAM_VALUE.MYEXTLIB_SHA { PARAM_VALUE.MYEXTLIB_SHA } {
	# Procedure called to update MYEXTLIB_SHA when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MYEXTLIB_SHA { PARAM_VALUE.MYEXTLIB_SHA } {
	# Procedure called to validate MYEXTLIB_SHA
	return true
}

proc update_PARAM_VALUE.MYLIB0_SHA { PARAM_VALUE.MYLIB0_SHA } {
	# Procedure called to update MYLIB0_SHA when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MYLIB0_SHA { PARAM_VALUE.MYLIB0_SHA } {
	# Procedure called to validate MYLIB0_SHA
	return true
}

proc update_PARAM_VALUE.MYLIB0_VER { PARAM_VALUE.MYLIB0_VER } {
	# Procedure called to update MYLIB0_VER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MYLIB0_VER { PARAM_VALUE.MYLIB0_VER } {
	# Procedure called to validate MYLIB0_VER
	return true
}

proc update_PARAM_VALUE.MYLIB1_SHA { PARAM_VALUE.MYLIB1_SHA } {
	# Procedure called to update MYLIB1_SHA when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MYLIB1_SHA { PARAM_VALUE.MYLIB1_SHA } {
	# Procedure called to validate MYLIB1_SHA
	return true
}

proc update_PARAM_VALUE.MYLIB1_VER { PARAM_VALUE.MYLIB1_VER } {
	# Procedure called to update MYLIB1_VER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MYLIB1_VER { PARAM_VALUE.MYLIB1_VER } {
	# Procedure called to validate MYLIB1_VER
	return true
}

proc update_PARAM_VALUE.TOP_SHA { PARAM_VALUE.TOP_SHA } {
	# Procedure called to update TOP_SHA when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TOP_SHA { PARAM_VALUE.TOP_SHA } {
	# Procedure called to validate TOP_SHA
	return true
}

proc update_PARAM_VALUE.TOP_VER { PARAM_VALUE.TOP_VER } {
	# Procedure called to update TOP_VER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TOP_VER { PARAM_VALUE.TOP_VER } {
	# Procedure called to validate TOP_VER
	return true
}

proc update_PARAM_VALUE.XML_SHA { PARAM_VALUE.XML_SHA } {
	# Procedure called to update XML_SHA when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.XML_SHA { PARAM_VALUE.XML_SHA } {
	# Procedure called to validate XML_SHA
	return true
}

proc update_PARAM_VALUE.XML_VER { PARAM_VALUE.XML_VER } {
	# Procedure called to update XML_VER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.XML_VER { PARAM_VALUE.XML_VER } {
	# Procedure called to validate XML_VER
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_DATA_WIDTH { PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to update C_S00_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_DATA_WIDTH { PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to validate C_S00_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_ADDR_WIDTH { PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to update C_S00_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_ADDR_WIDTH { PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to validate C_S00_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_BASEADDR { PARAM_VALUE.C_S00_AXI_BASEADDR } {
	# Procedure called to update C_S00_AXI_BASEADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_BASEADDR { PARAM_VALUE.C_S00_AXI_BASEADDR } {
	# Procedure called to validate C_S00_AXI_BASEADDR
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_HIGHADDR { PARAM_VALUE.C_S00_AXI_HIGHADDR } {
	# Procedure called to update C_S00_AXI_HIGHADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_HIGHADDR { PARAM_VALUE.C_S00_AXI_HIGHADDR } {
	# Procedure called to validate C_S00_AXI_HIGHADDR
	return true
}


proc update_MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.GLOBAL_DATE { MODELPARAM_VALUE.GLOBAL_DATE PARAM_VALUE.GLOBAL_DATE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.GLOBAL_DATE}] ${MODELPARAM_VALUE.GLOBAL_DATE}
}

proc update_MODELPARAM_VALUE.GLOBAL_TIME { MODELPARAM_VALUE.GLOBAL_TIME PARAM_VALUE.GLOBAL_TIME } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.GLOBAL_TIME}] ${MODELPARAM_VALUE.GLOBAL_TIME}
}

proc update_MODELPARAM_VALUE.GLOBAL_VER { MODELPARAM_VALUE.GLOBAL_VER PARAM_VALUE.GLOBAL_VER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.GLOBAL_VER}] ${MODELPARAM_VALUE.GLOBAL_VER}
}

proc update_MODELPARAM_VALUE.GLOBAL_SHA { MODELPARAM_VALUE.GLOBAL_SHA PARAM_VALUE.GLOBAL_SHA } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.GLOBAL_SHA}] ${MODELPARAM_VALUE.GLOBAL_SHA}
}

proc update_MODELPARAM_VALUE.TOP_SHA { MODELPARAM_VALUE.TOP_SHA PARAM_VALUE.TOP_SHA } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TOP_SHA}] ${MODELPARAM_VALUE.TOP_SHA}
}

proc update_MODELPARAM_VALUE.TOP_VER { MODELPARAM_VALUE.TOP_VER PARAM_VALUE.TOP_VER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TOP_VER}] ${MODELPARAM_VALUE.TOP_VER}
}

proc update_MODELPARAM_VALUE.CON_SHA { MODELPARAM_VALUE.CON_SHA PARAM_VALUE.CON_SHA } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CON_SHA}] ${MODELPARAM_VALUE.CON_SHA}
}

proc update_MODELPARAM_VALUE.CON_VER { MODELPARAM_VALUE.CON_VER PARAM_VALUE.CON_VER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CON_VER}] ${MODELPARAM_VALUE.CON_VER}
}

proc update_MODELPARAM_VALUE.HOG_SHA { MODELPARAM_VALUE.HOG_SHA PARAM_VALUE.HOG_SHA } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HOG_SHA}] ${MODELPARAM_VALUE.HOG_SHA}
}

proc update_MODELPARAM_VALUE.HOG_VER { MODELPARAM_VALUE.HOG_VER PARAM_VALUE.HOG_VER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HOG_VER}] ${MODELPARAM_VALUE.HOG_VER}
}

proc update_MODELPARAM_VALUE.XML_SHA { MODELPARAM_VALUE.XML_SHA PARAM_VALUE.XML_SHA } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.XML_SHA}] ${MODELPARAM_VALUE.XML_SHA}
}

proc update_MODELPARAM_VALUE.XML_VER { MODELPARAM_VALUE.XML_VER PARAM_VALUE.XML_VER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.XML_VER}] ${MODELPARAM_VALUE.XML_VER}
}

proc update_MODELPARAM_VALUE.MYLIB0_VER { MODELPARAM_VALUE.MYLIB0_VER PARAM_VALUE.MYLIB0_VER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MYLIB0_VER}] ${MODELPARAM_VALUE.MYLIB0_VER}
}

proc update_MODELPARAM_VALUE.MYLIB0_SHA { MODELPARAM_VALUE.MYLIB0_SHA PARAM_VALUE.MYLIB0_SHA } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MYLIB0_SHA}] ${MODELPARAM_VALUE.MYLIB0_SHA}
}

proc update_MODELPARAM_VALUE.MYLIB1_VER { MODELPARAM_VALUE.MYLIB1_VER PARAM_VALUE.MYLIB1_VER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MYLIB1_VER}] ${MODELPARAM_VALUE.MYLIB1_VER}
}

proc update_MODELPARAM_VALUE.MYLIB1_SHA { MODELPARAM_VALUE.MYLIB1_SHA PARAM_VALUE.MYLIB1_SHA } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MYLIB1_SHA}] ${MODELPARAM_VALUE.MYLIB1_SHA}
}

proc update_MODELPARAM_VALUE.MYEXTLIB_SHA { MODELPARAM_VALUE.MYEXTLIB_SHA PARAM_VALUE.MYEXTLIB_SHA } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MYEXTLIB_SHA}] ${MODELPARAM_VALUE.MYEXTLIB_SHA}
}

proc update_MODELPARAM_VALUE.FLAVOUR { MODELPARAM_VALUE.FLAVOUR PARAM_VALUE.FLAVOUR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FLAVOUR}] ${MODELPARAM_VALUE.FLAVOUR}
}

