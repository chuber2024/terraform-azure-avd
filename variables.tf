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
    "-snet-avd-01" = 1
    "-snet-adds-01" = 2
    "-snet-apps-01" = 3
  }
}

variable "public_subnets" {
  default = {
    "public_subnet_1" = 1
    "public_subnet_2" = 2
    "public_subnet_3" = 3
  }
}
