
variable "create_sg" {
  type        = bool
  default     = true
  description = "Whether to create a new security group"
}

variable "security_group_id" {
  type        = string
  default     = null
  description = "Existing SG ID if not creating one"
}

variable "sg_name" {
  type        = string
  default     = "postgresql-rds-sg"
}

variable "db_subnet_group_name" {}
variable "identifier" {}
variable "db_name" {}
variable "username" {}
variable "password" { sensitive = true }
variable "engine_version" {}
variable "instance_class" {}
variable "allocated_storage" {}
variable "max_allocated_storage" {}
variable "storage_type" {}
variable "storage_encrypted" {}
variable "publicly_accessible" {}
variable "multi_az" {}
variable "backup_retention_period" {}
variable "backup_window" {}
variable "maintenance_window" {}
variable "auto_minor_version_upgrade" {}
variable "skip_final_snapshot" {}
variable "deletion_protection" {}
variable "allowed_ports" {
  type = list(number)
}
variable "tags" {
  type = map(string)
}
