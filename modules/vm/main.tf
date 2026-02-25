terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.2-rc07"
    }
  }
}

resource "proxmox_vm_qemu" "vm" {
  count = var.vm_count
  target_node = "pve2"
  name        = "${var.base_name}-${count.index + 1}"
  vmid        = var.start_vmid + count.index
  clone       = var.template
  full_clone  = true

  cpu {
    cores = var.cpu
  }

  memory = var.memory

  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr0"
  }

  disk {
    slot    = "ide0"
    size    = "8000M"
    type    = "disk"
    storage = "ceph-vm-disks"
  }
}

