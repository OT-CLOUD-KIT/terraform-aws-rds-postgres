# Terraform-aws-rds-postgres

 ## PostgreSQL RDS Module
This Terraform module provisions a fully managed PostgreSQL RDS instance on AWS, including a subnet group and essential configurations.

## Architecture
![postge drawio](https://github.com/user-attachments/assets/2844974b-ec74-4184-bcdd-a29c6c40901f)
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

> **Note:**  
> The above example demonstrates how to use the module. All variables, resources, and outputs used here are already defined within this module.

## Input Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_engine_version"></a> [`engine_version`](#input_engine_version) | PostgreSQL engine version (e.g., `"15.3"`) | `string` | `"15.3"` | Yes |
| <a name="input_identifier_prefix_name"></a> [`identifier_prefix_name`](#input_identifier_prefix_name) | Prefix for the RDS instance ID | `string` | `"postgres"` | No |
| <a name="input_db_name"></a> [`db_name`](#input_db_name) | Name of the initial database | `string` | `"app_db"` | Yes |
| <a name="input_username"></a> [`username`](#input_username) | Master username | `string` | `"admin"` | Yes |
| <a name="input_password"></a> [`password`](#input_password) | Master password (should be stored securely) | `string` | `"Opstree#12345"` | Yes |
| <a name="input_instance_class"></a> [`instance_class`](#input_instance_class) | Instance type (e.g., `db.t3.micro`) | `string` | `"db.t3.micro"` | Yes |
| <a name="input_allocated_storage"></a> [`allocated_storage`](#input_allocated_storage) | Allocated storage in GB | `number` | `20` | Yes |
| <a name="input_storage_type"></a> [`storage_type`](#input_storage_type) | Storage type (`gp2`, `gp3`, `io1`) | `string` | `"gp3"` | No |
| <a name="input_multi_az"></a> [`multi_az`](#input_multi_az) | Enable Multi-AZ deployment | `bool` | `false` | No |
| <a name="input_public_access"></a> [`public_access`](#input_public_access) | Whether the DB is publicly accessible | `bool` | `false` | No |
| <a name="input_skip_final_snapshot"></a> [`skip_final_snapshot`](#input_skip_final_snapshot) | Skip final snapshot on deletion | `bool` | `true` | No |
| <a name="input_delete_automated_backups"></a> [`delete_automated_backups`](#input_delete_automated_backups) | Delete automated backups on instance deletion | `bool` | `true` | No |
| <a name="input_database_subnet_ids"></a> [`database_subnet_ids`](#input_database_subnet_ids) | Subnet IDs for the DB subnet group | `list(string)` | `[]` | Yes |
| <a name="input_database_security_groups"></a> [`database_security_groups`](#input_database_security_groups) | VPC security group IDs for the DB instance | `list(string)` | `[]` | Yes |
| <a name="input_primary_subnet_name"></a> [`primary_subnet_name`](#input_primary_subnet_name) | Name of the DB subnet group | `string` | `"postgres-subnet"` | Yes |
| <a name="input_tags"></a> [`tags`](#input_tags) | Tags to apply to all resources | `map(string)` | `{}` | No |

---

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_endpoint"></a> [`db_endpoint`](#output_db_endpoint) | DNS endpoint of the PostgreSQL RDS instance |
| <a name="output_db_instance_arn"></a> [`db_instance_arn`](#output_db_instance_arn) | ARN of the PostgreSQL RDS instance |
| <a name="output_db_instance_identifier"></a> [`db_instance_identifier`](#output_db_instance_identifier) | RDS instance identifier |


---


## Contributors

- [Piyush Upadhyay](https://github.com/piiiyuushh)
- [Nikita Joshi](https://github.com/jnikita19)
