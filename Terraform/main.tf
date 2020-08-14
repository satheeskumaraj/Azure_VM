provider "azurerm" {
    #version = "=1.44.0"
    subscription_id = "${var.Sub_ID}"
    tenant_id = "${var.Tenant_ID}"
}

module "resource_group" {
    source = "./rgroups"
    rname = "Staging"
    region = "East US"
}

module "vnet" {
    source = "./vnet"
    vname = "Vnet_Staging"
    cidr_block = "10.0.0.0/16"
    region = "East US"
    resource_group_name = "${module.resource_group.resource_group_name}"
}

module "subnet1" {
    source = "./subnet"
    subnet_name = "Staging_Subnet1"
    resource_group_name = "${module.resource_group.resource_group_name}"
    vnet_name = "${module.vnet.vnet_name}"
    subnet_block = "10.0.1.0/24"
}

module "network_interface" {
    source = "./network"
    count_number = 2
    network_name = "Staging_Network"
    region = "East US"
    resource_group_name = "${module.resource_group.resource_group_name}"
    ip_conf_name = "Staging_ip_config"
    subnet_id = "${module.subnet1.subnet_id}"
}

module "create_vm" {
    source = "./vmachine"
    vm_count = 2
    vmname = "VM_Staging"
    region = "East US"
    resource_group_name = "${module.resource_group.resource_group_name}"
    network_interface_ids = "${module.network_interface.network_interface_id}"
    vm_size = "Standard_B1ls"
    env = "Staging"
    os_disk_name = "mydisk_private"
    computer_name = "application"
}


module "network_interface_pub" {
    source = "./network_public"
    count_number = 1
    network_name = "Staging_Network_pub"
    region = "East US"
    resource_group_name = "${module.resource_group.resource_group_name}"
    ip_conf_name = "Staging_ip_config"
    subnet_id = "${module.subnet1.subnet_id}"
    env = "Staging"
    pub_ip_name = "Staging_pub_ip_name"
}

module "create_vm_public" {
    source = "./vmachine"
    vm_count = 1
    vmname = "VM_Staging_public"
    region = "East US"
    resource_group_name = "${module.resource_group.resource_group_name}"
    network_interface_ids = "${module.network_interface_pub.network_interface_pub_id}"
    vm_size = "Standard_B2s"
    env = "Staging"
    os_disk_name = "mydisk_public"
    computer_name = "gateway"
}