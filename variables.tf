variable "azclient_id" {}
variable "aztenant_id" {}
variable "azsubscription_id" {}
variable "azclient_secret" {}
variable "environment" {}
variable "env" {}
variable "gitenv" {}

variable "region" {
  type = string
}

variable "vnet_ipas" {
  type = string
}

variable "private_subnets" {
  default = {
    "-snet-avd"  = 1
    "-snet-adds" = 2
    "-snet-apps" = 3
  }
}

variable "public_subnets" {
  default = {
    "public_subnet_1" = 1
    "public_subnet_2" = 2
    "public_subnet_3" = 3
  }
}

variable "az-rg" {
  type = list(string)
}

variable "sa-name" {
  type = string
}

variable "sa-fsl-name" {
  type = string
}

variable "sa-fsl-ep-name" {
  type = string
}