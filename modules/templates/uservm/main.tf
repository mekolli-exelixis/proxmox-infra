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

module "uservm" {
  source      = "../../vm"
  vm_count    = 4
  base_name   = "user-vm-a"
  start_vmid  = 800
  cpu         = 1
  memory      = 1024
  template    = var.template_type
  target_node = "pve2"
}
