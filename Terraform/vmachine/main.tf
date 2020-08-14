resource "azurerm_virtual_machine" "vm_machine" {
 count                 = "${var.vm_count}"
 name                  = "${var.vmname}_${count.index}"
 location              = "${var.region}"
 resource_group_name   = "${var.resource_group_name}"
 network_interface_ids = ["${element(var.network_interface_ids, count.index)}"]
 vm_size               = "${var.vm_size}"

 storage_image_reference {
   publisher = "Canonical"
   offer     = "UbuntuServer"
   sku       = "16.04-LTS"
   version   = "latest"
 }

 storage_os_disk {
   name              = "${var.os_disk_name}_${count.index}"
   caching           = "ReadWrite"
   create_option     = "FromImage"
   managed_disk_type = "Standard_LRS"
 }


 os_profile {
   computer_name  = "${var.computer_name}-${count.index}"
   admin_username = "testadmin"
   admin_password = "Password1234!"
 }

 os_profile_linux_config {
   disable_password_authentication = false
 }

 tags = {
   environment = "${var.env}"
 }
}