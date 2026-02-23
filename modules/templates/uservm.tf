terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.2-rc07"
    }
  }
}

module "uservms" {
  source = "../vm"
  vm_count = 8
  base_name = "user-vm-a:"
  start_vmid = 500
  cpu = 2
  memory = 4096
  template = "user-vm"
}

