variable "zone" {
  description = "Work zone for vm"
  type = string
}

variable "name" {
  description = "Disk boot name"
  type = string
  default = "disk-boot-k8s"
}

variable "disk_size" {
  description = "Disk size GB"
  type = string
  default = "20"
}

variable "image-id" {
  description = "Image id"
  type = string
}