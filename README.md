# Terraform-aws-rds-postgres

 ## PostgreSQL RDS Module
This Terraform module provisions a fully managed PostgreSQL RDS instance on AWS, including a subnet group and essential configurations.

## Architecture
![Screenshot from 2025-06-16 12-08-52](https://github.com/user-attachments/assets/61867762-c739-4fde-beea-6d8db3eb0206)

---

## Usage

```hcl
module "postgres_rds" {
  source = "../"

  identifier              = var.identifier
  db_name                 = var.db_name
  username                = var.username
  password                = var.password
  db_subnet_group_name    = var.db_subnet_group_name
  subnet_ids              = var.subnet_ids
  security_group_ids      = var.security_group_ids
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  allocated_storage       = var.allocated_storage
  max_allocated_storage   = var.max_allocated_storage
  storage_type            = var.storage_type
  storage_encrypted       = var.storage_encrypted
  publicly_accessible     = var.publicly_accessible
  multi_az                = var.multi_az
  backup_retention_period = var.backup_retention_period
  backup_window           = var.backup_window
  maintenance_window      = var.maintenance_window
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  skip_final_snapshot     = var.skip_final_snapshot
  deletion_protection     = var.deletion_protection

  tags = var.tags
}


```
## Input Variables

| Name                      | Description                                                       | Type            | Default             | Required |
|---------------------------|-------------------------------------------------------------------|------------------|---------------------|----------|
| `engine_version`          | PostgreSQL engine version (e.g., `"15.3"`)                        | `string`         | `"15.3"`            | Yes   |
| `identifier_prefix_name`  | Prefix for the RDS instance ID                                    | `string`         | `"postgres"`        | No    |
| `db_name`                 | Name of the initial database                                      | `string`         | `"app_db"`          | Yes   |
| `username`                | Master username                                                   | `string`         | `"admin"`           | Yes   |
| `password`                | Master password (should be stored securely)                       | `string`         | `"Opstree#12345"`   | Yes   |
| `instance_class`          | Instance type (e.g., `db.t3.micro`)                               | `string`         | `"db.t3.micro"`     | Yes   |
| `allocated_storage`       | Allocated storage in GB                                           | `number`         | `20`                | Yes   |
| `storage_type`            | Storage type (`gp2`, `gp3`, `io1`)                                | `string`         | `"gp3"`             | No    |
| `multi_az`                | Enable Multi-AZ deployment                                        | `bool`           | `false`             | No    |
| `public_access`           | Whether the DB is publicly accessible                             | `bool`           | `false`             |  No    |
| `skip_final_snapshot`     | Skip final snapshot on deletion                                   | `bool`           | `true`              | No    |
| `delete_automated_backups`| Delete automated backups on instance deletion                     | `bool`           | `true`              | No    |
| `database_subnet_ids`     | Subnet IDs for the DB subnet group                                | `list(string)`   | `[]`                | Yes   |
| `database_security_groups`| VPC security group IDs for the DB instance                        | `list(string)`   | `[]`                | Yes   |
| `primary_subnet_name`     | Name of the DB subnet group                                       | `string`         | `"postgres-subnet"` | Yes   |
| `tags`                    | Tags to apply to all resources                                    | `map(string)`    | `{}`                | No    |

---

##  Outputs

| Output Name              | Description                                |
|--------------------------|--------------------------------------------|
| `db_endpoint`            | DNS endpoint of the PostgreSQL RDS instance |
| `db_instance_arn`        | ARN of the PostgreSQL RDS instance          |
| `db_instance_identifier` | RDS instance identifier                     |

---
