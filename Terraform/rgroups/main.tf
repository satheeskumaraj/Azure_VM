resource "azurerm_resource_group" "rgroup" {
  name     = "${var.rname}"
  location = "${var.region}"
}