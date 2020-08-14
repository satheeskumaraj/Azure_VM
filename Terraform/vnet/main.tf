resource "azurerm_virtual_network" "vnet" {
  name                = "${var.vname}"
  address_space       = ["${var.cidr_block}"]
  location            = "${var.region}"
  resource_group_name = "${var.resource_group_name}"
}