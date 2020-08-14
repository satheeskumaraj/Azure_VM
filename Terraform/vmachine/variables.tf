variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created"
  default     = "Staging"
}

variable "region" {
  description = "The location where the resources will be created"
  default     = "East US"
}

variable "vmname" {
  description = "VM name"
  default     = "Staging"
}

variable "vm_count" {
  description = "count"
  default     = 1
}

variable "network_interface_ids" {
    type = list
    description = "(optional) describe your variable"
}

variable "vm_size" {
    type = string
    description = "(optional) describe your variable"
    default = "Standard_B1Is"
}

variable "env" {
    type = string
    description = "(optional) describe your variable"
    default = "Staging"
}

variable "os_disk_name" {
  type = string
  description = "(optional) describe your variable"
  default = "mydisk"
}

variable "computer_name" {
  type = string
  description = "(optional) describe your variable"
  default = "hostname"
}