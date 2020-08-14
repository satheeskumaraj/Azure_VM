output "network_interface_pub_id" {
    value = "${azurerm_network_interface.network_interface.*.id}"
}