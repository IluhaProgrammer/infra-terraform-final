terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.179.0"

  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket = "infra-final"
    region = "ru-central1-a"
    key = "final/terraform.tfstate"

    skip_region_validation = true
    skip_credentials_validation = true
    skip_requesting_account_id = true
    skip_s3_checksum = true
  }
}

provider "yandex" {
  zone = var.zone-main
}

module "k8s" {
  source = "./modules/k8s"
  subnet_id = module.subnet-k8s.subnet_id
  boot_disk_id = module.disk-k8s.disk_id
  zone = var.zone-main
  ids-sg = module.group-security.sg-ids

}

module "disk-k8s" {
  source = "./modules/disk-k8s"
  zone = var.zone-main
  image-id = module.disk-image-k8s.image-id
}

module "subnet-k8s" {
  source = "./modules/subnet-k8s"
  network_id = module.network.net_id
  zone = var.zone-main
}

module "network" {
  source = "./modules/network"
}

module "group-security" {
  source = "./modules/security-groups"
  network_id = module.network.net_id
}

module "disk-image-k8s" {
  source = "./modules/image-k8s"
}