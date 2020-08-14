variable "network_name" {
  description = "Network name"
  default     = "Staging-Network"
}

variable "region" {
  description = "The location where the resources will be created"
  default     = "East US"
}

variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created"
  default     = "Staging"
}

variable "ip_conf_name" {
  description = "Name of the ip configuration"
  default     = "Staging-ip-config"
}

variable "subnet_id" {
  description = "subnet_id"
  default     = ""
}

variable "count_number" {
  description = "count"
  default     = 1
}

variable "env" {
    type = string
    description = "(optional) describe your variable"
    default = "Staging"
}

variable "pub_ip_name" {
    type = string
    description = "(optional) describe your variable"
    default = "Staging_pub_ip"
}