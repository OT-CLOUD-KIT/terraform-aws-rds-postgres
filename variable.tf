variable "vpc_id" {
  description = "VPC ID where RDS and security group will be created or used"
  type        = string
}

variable "subnet_ids" {
  description = "List of private subnet IDs for DB subnet group"
  type        = list(string)
}

variable "allowed_ports" {
  description = "List of allowed ingress ports for the RDS security group"
  type        = list(number)
}

variable "create_sg" {
  description = "Whether to create a new security group or use an existing one"
  type        = bool
  default     = true
}

variable "security_group_id" {
  description = "Existing security group ID to attach to RDS if create_sg is false"
  type        = string
  default     = null
}

variable "sg_name" {
  description = "Name of the security group (used only if create_sg = true)"
  type        = string
  default     = "postgresql-rds-sg"
}

variable "db_subnet_group_name" {
  description = "Name for the DB subnet group"
  type        = string
}

variable "identifier" {
  description = "Unique identifier for the RDS instance"
  type        = string
}

variable "engine_version" {
  description = "PostgreSQL engine version"
  type        = string
}

variable "instance_class" {
  description = "Instance class for the RDS instance (e.g., db.t3.micro)"
  type        = string
}

variable "db_name" {
  description = "Initial database name to create"
  type        = string
}

variable "username" {
  description = "Master username for the database"
  type        = string
}

variable "password" {
  description = "Master password for the database"
  type        = string
  sensitive   = true
}

variable "allocated_storage" {
  description = "Initial storage size in GB"
  type        = number
}

variable "max_allocated_storage" {
  description = "Maximum storage size in GB"
  type        = number
}

variable "storage_type" {
  description = "Storage type (e.g., gp2, gp3)"
  type        = string
}

variable "storage_encrypted" {
  description = "Whether to enable encryption for the storage"
  type        = bool
}

variable "publicly_accessible" {
  description = "Whether the DB instance is publicly accessible"
  type        = bool
}

variable "multi_az" {
  description = "Whether to enable Multi-AZ deployment"
  type        = bool
}

variable "backup_retention_period" {
  description = "Number of days to retain backups"
  type        = number
}

variable "backup_window" {
  description = "Preferred backup window (e.g., 03:00-04:00)"
  type        = string
}

variable "maintenance_window" {
  description = "Preferred maintenance window (e.g., sun:05:00-sun:06:00)"
  type        = string
}

variable "auto_minor_version_upgrade" {
  description = "Whether to enable auto minor version upgrades"
  type        = bool
}

variable "skip_final_snapshot" {
  description = "Whether to skip final snapshot on deletion"
  type        = bool
}

variable "deletion_protection" {
  description = "Whether to enable deletion protection"
  type        = bool
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
}