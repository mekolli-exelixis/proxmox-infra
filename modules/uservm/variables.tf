variable "template_type" {
  type        = string
  description = "Proxmox template name or VMID to clone from for user VMs"

  validation {
    condition     = length(trimspace(var.template_type)) > 0
    error_message = "template_type must be non-empty."
  }
}

variable "vm_count" {
  type        = number
  default     = 4
  description = "Number of user VMs to create"

  validation {
    condition     = var.vm_count >= 1 && var.vm_count <= 256
    error_message = "vm_count must be between 1 and 256."
  }
}

variable "base_name" {
  type        = string
  default     = "user-vm-a"
  description = "Base name for VM naming (suffix -1, -2, etc. added)"

  validation {
    condition     = length(trimspace(var.base_name)) > 0 && length(var.base_name) <= 64
    error_message = "base_name must be non-empty and at most 64 characters."
  }
}

variable "start_vmid" {
  type        = number
  default     = 800
  description = "Starting VMID for the first user VM (Proxmox allows 100-999999999)"

  validation {
    condition     = var.start_vmid >= 100 && var.start_vmid <= 999999999
    error_message = "start_vmid must be between 100 and 999999999."
  }
}

variable "cpu" {
  type        = number
  default     = 1
  description = "Number of CPU cores per VM"

  validation {
    condition     = var.cpu >= 1 && var.cpu <= 128
    error_message = "cpu must be between 1 and 128 cores."
  }
}

variable "memory" {
  type        = number
  default     = 1024
  description = "Memory in MB per VM"

  validation {
    condition     = var.memory >= 128
    error_message = "memory must be at least 128 MB."
  }
}

variable "target_node" {
  type        = string
  default     = "pve2"
  description = "Proxmox node name to deploy VMs on"

  validation {
    condition     = length(trimspace(var.target_node)) > 0
    error_message = "target_node must be non-empty."
  }
}
