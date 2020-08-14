variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created"
  default     = "Staging"
}

variable "region" {
  description = "The location where the resources will be created"
  default     = "East US"
}

variable "cidr_block" {
  description = "Ip range for thar vitural network"
  default     = "10.0.0.0/16"
}

variable "vname" {
  description = "virtual network name"
  default     = "Staging"
}