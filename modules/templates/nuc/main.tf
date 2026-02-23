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

module "nuc" {
  source      = "../../vm"
  vm_count    = 3
  base_name   = "nuc-vm-a"
  start_vmid  = 400
  cpu         = 2
  memory      = 4096
  template    = var.template_type
}
