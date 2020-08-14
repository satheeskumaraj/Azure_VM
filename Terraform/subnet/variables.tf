variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created"
  default     = "Staging"
}

variable "vnet_name" {
  description = "virtual network name"
  default     = "Staging"
}

variable "subnet_name" {
  description = "Name for subnet"
  default     = "Staging-Subnet"
}

variable "subnet_block" {
  description = "Subnet Block range"
  default     = "10.0.1.0/24"
}