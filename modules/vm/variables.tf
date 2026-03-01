variable "vm_count" {
  type        = number
  description = "Number of VMs to create"

  validation {
    condition     = var.vm_count >= 1 && var.vm_count <= 256
    error_message = "vm_count must be between 1 and 256."
  }
}

variable "base_name" {
  type        = string
  description = "Base name for VM naming (suffix -1, -2, etc. added)"

  validation {
    condition     = length(trimspace(var.base_name)) > 0 && length(var.base_name) <= 64
    error_message = "base_name must be non-empty and at most 64 characters."
  }
}

variable "start_vmid" {
  type        = number
  description = "Starting VMID for the first VM (Proxmox allows 100-999999999)"

  validation {
    condition     = var.start_vmid >= 100 && var.start_vmid <= 999999999
    error_message = "start_vmid must be between 100 and 999999999."
  }
}

variable "cpu" {
  type        = number
  description = "Number of CPU cores per VM"

  validation {
    condition     = var.cpu >= 1 && var.cpu <= 128
    error_message = "cpu must be between 1 and 128 cores."
  }
}

variable "memory" {
  type        = number
  description = "Memory in MB per VM"

  validation {
    condition     = var.memory >= 128
    error_message = "memory must be at least 128 MB."
  }
}

variable "template" {
  type        = string
  description = "Proxmox template name or VMID to clone from"

  validation {
    condition     = length(trimspace(var.template)) > 0
    error_message = "template must be non-empty."
  }
}

variable "target_node" {
  type        = string
  description = "Proxmox node name to deploy VMs on"

  validation {
    condition     = length(trimspace(var.target_node)) > 0
    error_message = "target_node must be non-empty."
  }
}

# Network (optional overrides)
variable "network_id" {
  type        = number
  default     = 0
  description = "Network interface ID (e.g. 0 for first NIC)"

  validation {
    condition     = var.network_id >= 0 && var.network_id <= 15
    error_message = "network_id must be between 0 and 15."
  }
}

variable "network_model" {
  type        = string
  default     = "virtio"
  description = "Network device model (e.g. virtio, e1000, rtl8139)"

  validation {
    condition     = contains(["virtio", "e1000", "rtl8139", "vmxnet3", "ne2k_pci"], var.network_model)
    error_message = "network_model must be one of: virtio, e1000, rtl8139, vmxnet3, ne2k_pci."
  }
}

variable "network_bridge" {
  type        = string
  default     = "vmbr0"
  description = "Bridge to attach the network interface to"

  validation {
    condition     = length(trimspace(var.network_bridge)) > 0
    error_message = "network_bridge must be non-empty."
  }
}

# Disk (optional overrides)
variable "disk_slot" {
  type        = string
  default     = "ide0"
  description = "Slot for the disk device (e.g. ide0, scsi0)"

  validation {
    condition     = can(regex("^(ide|scsi|sata)[0-9]+$", var.disk_slot))
    error_message = "disk_slot must be a valid slot like ide0, scsi0, or sata0."
  }
}

variable "disk_size" {
  type        = string
  default     = "8000M"
  description = "Disk size with unit (e.g. 8000M, 32G)"

  validation {
    condition     = can(regex("^[0-9]+[KMGTP]?$", var.disk_size))
    error_message = "disk_size must match pattern like 8000M, 32G, 1T."
  }
}

variable "disk_type" {
  type        = string
  default     = "disk"
  description = "Disk type: disk or scsi"

  validation {
    condition     = contains(["disk", "scsi"], var.disk_type)
    error_message = "disk_type must be either disk or scsi."
  }
}

variable "disk_storage" {
  type        = string
  default     = "ceph-vm-disks"
  description = "Proxmox storage pool for the disk"

  validation {
    condition     = length(trimspace(var.disk_storage)) > 0
    error_message = "disk_storage must be non-empty."
  }
}
