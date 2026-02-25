terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.2-rc07"
    }
  }
}

variable "template_type" {
  type = string
}

module "dhcp" {
  source      = "../../vm"
  vm_count    = 2
  base_name   = "dhcp-vm-a"
  start_vmid  = 200
  cpu         = 4
  memory      = 8096
  template    = var.template_type
  targe_node  = "pve2"
}
