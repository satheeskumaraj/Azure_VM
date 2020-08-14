resource "azurerm_subnet" "subnet_internal" {
  name                 = "${var.subnet_name}"
  resource_group_name  = "${var.resource_group_name}"
  virtual_network_name = "${var.vnet_name}"
  address_prefix       = "${var.subnet_block}"
}