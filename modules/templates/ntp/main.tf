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

module "ntp" {
  source      = "../../vm"
  vm_count    = 2
  base_name   = "ntp-vm-a"
  start_vmid  = 800
  cpu         = 1
  memory      = 2048
  template    = var.template_type
  targe_node  = "pve2"
}
