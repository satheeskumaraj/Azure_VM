resource "azurerm_public_ip" "public" {
  name                    = "${var.pub_ip_name}"
  location                = "${var.region}"
  resource_group_name     = "${var.resource_group_name}"
  allocation_method       = "Dynamic"
  idle_timeout_in_minutes = 30

  tags = {
    environment = "${var.env}"
  }
}

resource "azurerm_network_interface" "network_interface" {
  count               = "${var.count_number}"
  name                = "${var.network_name}_${count.index}"
  location            = "${var.region}"
  resource_group_name = "${var.resource_group_name}"

  ip_configuration {
    name                          = "${var.ip_conf_name}_${count.index}"
    subnet_id                     = "${var.subnet_id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public.id
  }
}