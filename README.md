# Terraform-aws-rds-postgres

This Terraform module provisions a fully managed PostgreSQL RDS instance on AWS. It includes the creation of a DB subnet group and essential configurations for high availability, performance, and security.


## Architecture
![updated_postgres drawio](https://github.com/user-attachments/assets/4562d8fe-3a14-4717-87f2-cf9f658c9cda)

---



## Usage

```hcl

module "postgres_rds" {
  source = "OT-CLOUD-KIT/terraform-aws-rds-postgres" 

  vpc_id        = "vpc-0123456789abcdef0"

  subnet_ids    = [
    "subnet-aaa111bbb222ccc33",
    "subnet-ddd444eee555fff66"
  ]

  allowed_ports = [5432, 5433]

  create_sg         = true
  security_group_id = null
  sg_name           = "dev-postgres-sg"

  db_subnet_group_name       = "postgres-db-subnet-group"
  identifier                 = "postgres"
  db_name                    = "postgresdb"
  username                   = "postgres"
  password                   = "Postgres123"
  engine_version             = "16"
  instance_class             = "db.t3.micro"
  allocated_storage          = 20
  max_allocated_storage      = 100
  storage_type               = "gp2"
  storage_encrypted          = true
  publicly_accessible        = false
  multi_az                   = false
  backup_retention_period    = 7
  backup_window              = "03:00-04:00"
  maintenance_window         = "sun:05:00-sun:06:00"
  auto_minor_version_upgrade = true
  skip_final_snapshot        = true
  deletion_protection        = false

  tags = {
    Environment = "dev"
    Team        = "Ninjas"
    Project     = "PostgreSQL"
  }
}


```

> **Note:**  
> The above example demonstrates how to use the module. All variables, resources, and outputs used here are already defined within this module.


## Resources

| Name | Type |
|------|------|
| [aws_db_subnet_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_db_instance.postgres](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |


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
