variable "azclient_id" {}
variable "aztenant_id" {}
variable "azsubscription_id" {}
variable "azclient_secret" {}
variable "environment" {}
variable "gitenv" {}

variable "region" {
  type = string
}

variable "vnet_ipas" {
  type = string
}

variable "private_subnets" {}

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
variable "env" {
  type = string
}