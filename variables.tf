variable "PM_API_URL" {
  type        = string
  description = "Proxmox API base URL (e.g. https://host:8006/api2/json)"

  validation {
    condition     = can(regex("^https?://", var.PM_API_URL)) && length(trimspace(var.PM_API_URL)) > 0
    error_message = "PM_API_URL must be a non-empty URL starting with http:// or https://."
  }
}

variable "PM_API_TOKEN_ID" {
  type        = string
  description = "Proxmox API token ID (e.g. user@pam!tokenname)"

  validation {
    condition     = length(trimspace(var.PM_API_TOKEN_ID)) > 0
    error_message = "PM_API_TOKEN_ID must be non-empty."
  }
}

variable "PM_API_TOKEN_SECRET" {
  type        = string
  description = "Proxmox API token secret"
  sensitive   = true

  validation {
    condition     = length(var.PM_API_TOKEN_SECRET) > 0
    error_message = "PM_API_TOKEN_SECRET must be non-empty."
  }
}

variable "pm_tls_insecure" {
  type        = bool
  default     = true
  description = "Whether to skip TLS verification for the Proxmox API (e.g. for self-signed certs)"
}
