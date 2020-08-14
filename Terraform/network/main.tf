resource "azurerm_network_interface" "network_interface" {
  count               = "${var.count_number}"
  name                = "${var.network_name}_${count.index}"
  location            = "${var.region}"
  resource_group_name = "${var.resource_group_name}"

  ip_configuration {
    name                          = "${var.ip_conf_name}_${count.index}"
    subnet_id                     = "${var.subnet_id}"
    private_ip_address_allocation = "Dynamic"
  }
}