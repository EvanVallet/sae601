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

resource "proxmox_virtual_environment_vm" "node_clone" {
  name      = "node-clone"
  node_name = "evan"

  clone {
    vm_id = linux-template
  }

  agent {
    enabled = true
  }

  memory {
    dedicated = 2048
  }

  initialization {
    dns {
      servers = ["8.8.8.8"]
    }
    ip_config {
      ipv4 {
        address = "10.129.4.165"
      }
    }
  }
}

output "vm_ipv4_address" {
  value = proxmox_virtual_environment_vm.node_clone.ipv4_addresses[1][0]
}