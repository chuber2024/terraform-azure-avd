variable "azclient_id" {}
variable "aztenant_id" {}
variable "azsubscription_id" {}
variable "azclient_secret" {}
variable "environment" {}
variable "env" {}
variable "gitenv" {}

variable "region" {
  default = "West Europe"
}

variable "vnet_ipas" {
  type    = string
  default = "10.100.0.0/16"
}

variable "private_subnets" {
  default = {
    "private_subnet_1" = 1
    "private_subnet_2" = 2
    "private_subnet_3" = 3
  }
}

variable "public_subnets" {
  default = {
    "public_subnet_1" = 1
    "public_subnet_2" = 2
    "public_subnet_3" = 3
  }
}
