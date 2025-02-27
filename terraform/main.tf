terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.42.0"
    }
  }
}

provider "proxmox" {
  endpoint = "http://10.129.4.160:8006/"
  insecure = true
  username = "terraform-prov@pve"
  password = "totototo"
}