terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.179.0"
}

resource "yandex_vpc_security_group" "nat-instance" {
  name = var.name
  network_id = var.network_id

  egress {
    protocol = "ANY"
    description = "any"
    v4_cidr_blocks = var.v4_cidr_blocks
  }

  ingress {
    protocol = "TCP"
    description = "ssh"
    v4_cidr_blocks = var.v4_cidr_blocks
    port = 22
  }

  ingress {
    protocol = "TCP"
    description = "ext-http"
    v4_cidr_blocks = var.v4_cidr_blocks
    port = 80
  }

  ingress {
    protocol = "TCP"
    description = "ext-https"
    v4_cidr_blocks = var.v4_cidr_blocks
    port = 443
  }

  ingress {
    protocol = "ANY"
    description = "any"
    v4_cidr_blocks = var.v4_cidr_blocks
  }

  ingress {
    protocol = "ICMP"
    description = "ping icmp"
    v4_cidr_blocks = var.v4_cidr_blocks
  }
}