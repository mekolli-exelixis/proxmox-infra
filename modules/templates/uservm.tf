module "uservms" {
  source = "../vm"
  vm_count = 40
  base_name = "user"
  start_vmid = 900
  cpu = 1
  memory = 512
  template = "UserVM-Template"
}

