output "sg-ids" {
  description = "ids sg"
  value = yandex_vpc_security_group.nat-instance.id
}