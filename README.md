**Proxmox-infra**

Infrastructure-as-Code for deploying and managing virtual machines on a Proxmox cluster using Terraform.
Includes a modular VM template system, category‑based VM definitions, and a priority‑driven monitoring framework to ensure critical VMs stay online.

**Overview**

This repository provides:
A modular Terraform architecture for deploying multiple VM categories (DHCP, NTP, user VMs, etc.)

**Flexible VM definitions with customizable:**

+ CPU
+ Memory
+ VMID ranges
+ Templates
  
**Naming conventions**

A priority‑based monitoring system that periodically checks VM status and auto‑starts them if needed
A clean folder structure suitable for long‑term maintenance and scaling
```
tf-proxmox-infra/
├── README.md
├── main.tf
├── variables.tf
├── terraform.tfvars          # ignored by Git
├── modules/
│   ├── vm/                   # reusable VM module
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── dhcp/                 # DHCP VM definitions
│   ├── ntp/                  # NTP VM definitions
│   ├── nuc/                  # NUC VM definitions
│   └── uservm/               # user VM definitions
└── scripts/
    ├── check_priority.sh     # shared monitoring logic
    ├── check_dhcp.sh
    ├── check_ntp.sh
    ├── check_uservms.sh
    └── vm_list/
        ├── dhcp.list
        ├── ntp.list
        └── uservms.list
```
**Install Dependencies**

+ Terraform
+ jq
+ curl
```
pm_api_url          = "https://<proxmox-ip>:8006/api2/json"
pm_api_token_id     = "user@pam!token"
pm_api_token_secret = "your-secret"
pm_tls_insecure     = true
```
**Initialize Terraform**

terraform init

**Review the plan**

terraform plan

**Apply changes**

terraform apply

**VM Templates (DHCP, NTP, User VMs)**

Each VM category is defined as a module directly under modules/

**Example: DHCP servers**

```
module "dhcp" {
  source     = "../vm"
  vm_count   = 2
  base_name  = "dhcp"
  start_vmid = 800
  cpu        = 2
  memory     = 2048
  template   = "DHCP-Template"
}

```
**VM Module (Reusable)**
The VM module supports:

+ Custom CPU
+ Custom RAM
+ Custom VMID ranges
+ Custom template names
+ Automatic naming
+ Automatic node distribution (optional)
  
**Example variables:**
```
variable "vm_count" {}
variable "base_name" {}
variable "start_vmid" {}
variable "cpu" {}
variable "memory" {}
variable "template" {}
```
**Priority-Based Monitoring System**

Critical VMs (DHCP, NTP, etc.) are monitored more frequently than user VMs.

**VM Lists**
Located in scripts/vm_list/:
+ dhcp.list
+ ntp.list
+ uservms.list
Each file contains VMIDs to monitor.

**Shared Monitoring Logic**



**Category Scripts**



**Cron Job Scheduling**


  






