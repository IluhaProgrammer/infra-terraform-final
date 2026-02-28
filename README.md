# 🚀 Infrastructure Provisioning (Terraform + Yandex Cloud)

## 📌 Overview

Данный модуль отвечает за создание инфраструктуры в **Yandex Cloud** для Kubernetes-лабораторной работы.

Инфраструктура разворачивается с помощью **Terraform** и включает:

- VPC Network
    
- Subnets
    
- Security Groups
    
- Compute Instances (k8s nodes)
    
- Boot disk
    
- Custom image
    
- SSH access
    
- Remote backend (S3-compatible, Yandex Object Storage)

## 📂 Project Structure

```
infra/
├── .terraform/
├── modules/
│   ├── disk-k8s/
│   ├── image-k8s/
│   ├── k8s/
│   ├── network/
│   ├── security-groups/
│   └── subnet-k8s/
│
├── ssh/
│
├── main.tf
├── variables.tf
├── terraform.tfvars
├── key.json
├── .terraform.lock.hcl
└── .gitignore
```

## 📦 Modules Description

### 🔹 network

Создание VPC сети.

### 🔹 subnet-k8s

Создание подсети в указанной зоне доступности.

### 🔹 security-groups

Настройка firewall правил:

- SSH (22)
    
- HTTP/HTTPS
    
- Internal traffic
    

### 🔹 image-k8s

Использование базового образа (Ubuntu / YC image).

### 🔹 disk-k8s

Создание boot-диска для инстанса.

### 🔹 k8s

Создание виртуальной машины для Kubernetes-ноды.

## Backend configuration

```
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

```

## Этапы создания S3 backend на Yandex Cloud 

Создать сервсиный аккаунт на Yandex Cloud
<img width="1915" height="475" alt="image" src="https://github.com/user-attachments/assets/4149869f-eeff-443b-82c4-77b7ea67c9c5" />

Далее создадим ключ key.json 
```
yc iam access-key create \
  --service-account-name terraform-user \
  --description "this key is for my bucket"
```

Далее создадим автризованный ключ
```
yc iam key create \
  --service-account-id <serviceaccount-id> \
  --folder-name terraform-proj \
  --output key.json
```

Создадим профиль, через него наш сервисный аккаунт будет работать с облаком
```
yc config profile create <имя_профиля>
```

Далее вот такие переменные экспортируем через Yandex Cloud 
```
yc config set service-account-key key.json
yc config set cloud-id <cloud-id>  
yc config set folder-id <folder-id>
```

И так же локально их экспортим
```
export YC_TOKEN=$(yc iam create-token)
export YC_CLOUD_ID=$(yc config get cloud-id)
export YC_FOLDER_ID=$(yc config get folder-id)
```

Далее создадим bucket, тот самый backend на нашем Yandex Cloud
<img width="1118" height="412" alt="image" src="https://github.com/user-attachments/assets/1dea3751-3eb8-416b-8feb-1b8566b9fb2d" />

Далее эскпортим 2 наших ключа, их можно найти в шаге про создание первого ключа
```
export ACCESS_KEY="Access-key"
export SECRET_KEY="Secret-key"
```

Далее для инициализации S3 Backend будем использовать вот такую команду
```
terraform init -backend-config="access_key=$ACCESS_KEY" -backend-config="secret_key=$SECRET_KEY"
```

Проверим что все горит зеленым, значит инициализация прошла успешно
<img width="1111" height="388" alt="image" src="https://github.com/user-attachments/assets/c1996cdb-6562-4f56-8a7b-e9b3671c53bf" />

Далее уже работа с terraform будет максимально обычно, то есть просто создаем модули, подключаем их, инициаизируем и применяем через terraform apply либо убиваем инфру через terraform destroy

## Что дальше?

Это первый шаг по лабе моей, создание инфры, далее мне ее надо настроить, это я буду делать через Ansible с ее модулями
