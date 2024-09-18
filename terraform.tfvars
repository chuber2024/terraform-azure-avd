vnet_ipas      = "10.100.0.0/16"
vnet_sec    = "192.168.100.0/24"
region         = "West Europe"
az-rg          = ["shared", "avd", "adds", "secmon", "net"]
sa-name        = "gensaavddiag001"
sa-fsl-name    = "gensaavdfslgx001"
sa-fsl-ep-name = "gensaavdfslgx001-ep01"
env            = "plt"
private_subnets = {
  "plt-snet-avd"  = 1
  "plt-snet-adds" = 2
  "plt-snet-apps" = 3
}
bastion_subnet = "192.168.100.224/27"
sharename        = "userprofiles"
nic-advm-name    = "nic-advm-01"
ip-nic-advm-name = "ip-nic-advm-01"