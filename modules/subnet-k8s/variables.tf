variable "name" {
  description = "Subnet name"
  type = string
  default = "subnet-k8s"
}

variable "zone" {
  description = "Zone for vm"
  type = string
}

variable "network_id" {
  description = "Network id"
  type = string
}

variable "cidr4_subnet" {
  description = "IPv4 pool"
  type = list(string)
  default = [ "192.168.101.0/24" ]
}