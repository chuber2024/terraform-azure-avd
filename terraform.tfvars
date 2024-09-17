vnet_ipas       = "10.100.0.0/16"
region          = "West Europe"
az-rg           = ["shared", "avd", "adds", "secmon", "net"]
sa-name         = "gensaavddiag001"
sa-fsl-name     = "gensaavdfslgx001"
sa-fsl-ep-name  = "gensaavdfslgx001-ep01"
env             = "plt"
private_subnets = {
  "${var.env}-snet-avd" = 1
  "${var.env}-snet-adds" = 2
  "${var.env}-snet-apps" = 3
}