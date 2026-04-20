# Terraform VM Module for Yandex Cloud

## Описание
Модуль `vm_module` создает:

- Виртуальную машину в Yandex Cloud
- Дополнительный подключаемый диск
- Сетевой интерфейс
- Настраивает SSH-доступ

Модуль полностью параметризован и подходит для разных окружений (dev, stage, prod).

## Параметры модуля

| Параметр | Тип | Описание |
|---------|-----|----------|
| `name` | string | Имя ВМ |
| `cpu` | number | Количество CPU |
| `memory` | number | RAM (ГБ) |
| `disk_size` | number | Размер диска (ГБ) |
| `subnet_id` | string | ID подсети |
| `ssh_key` | string | Публичный SSH ключ |

---

## Outputs

| Output | Описание |
|--------|----------|
| `vm_id` | ID виртуальной машины |
| `vm_name` | Имя машины |
| `internal_ip` | Внутренний IP |
| `external_ip` | Внешний IP |
| `disk_id` | ID подключаемого диска |

---

## Запуск

### Dev

```sh
cd envs/dev
terraform init
terraform apply -var-file="dev.tfvars"
```

### Stage

```sh
cd envs/stage
terraform init
terraform apply -var-file="stage.tfvars"
```

### Prod

```sh
cd envs/prod
terraform init
terraform apply -var-file="prod.tfvars"
```