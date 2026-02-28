output "subnet_id" {
  description = "Subnet id"
  value = yandex_vpc_subnet.k8s-subnet.id
}