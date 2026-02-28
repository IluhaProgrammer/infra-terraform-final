variable "name" {
  description = "Group security"
  type = string
  default = "group-sec-1"
}

variable "network_id" {
  description = "Network id"
  type = string
}

variable "v4_cidr_blocks" {
  description = "V4 CIDR blocks"
  type = list(string)
  default = [ "0.0.0.0/0" ]
}