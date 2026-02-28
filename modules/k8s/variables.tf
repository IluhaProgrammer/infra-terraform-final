variable "name" {
  description = "Monitoring vm name"
  type = string
  default = "k8s"
}

variable "zone" {
  description = "Zone for vm"
  type = string
}

variable "cores" {
  description = "Cores for vm"
  type = number
  default = 2
}

variable "memory" {
  description = "Memory for vm"
  type = number
  default = 4
}

variable "boot_disk_id" {
  description = "Boot disk id"
  type = string
}

variable "subnet_id" {
  description = "Subnet id for vm"
  type = string
}

variable "ids-sg" {
  description = "IDS sg"
  type = string
}