variable "vpc_id" {
  description = "VPC ID to use for the RDS instance"
  type        = string
}

variable "subnet_ids" {
  description = "List of private subnet IDs for the DB subnet group"
  type        = list(string)
}

variable "allowed_ports" {
  description = "List of allowed ports for inbound traffic"
  type        = list(number)
}

variable "create_sg" {
  description = "Whether to create a new security group or use an existing one"
  type        = bool
  default     = true
}

variable "security_group_id" {
  description = "Existing security group ID (used if create_sg is false)"
  type        = string
  default     = null
}

variable "sg_name" {
  description = "Security group name (if created)"
  type        = string
  default     = "postgresql-rds-sg"
}

variable "db_subnet_group_name" {
  description = "Name of the RDS subnet group"
  type        = string
}

variable "identifier" {
  description = "Unique identifier for the RDS instance"
  type        = string
}

variable "db_name" {
  description = "Initial database name"
  type        = string
}

variable "username" {
  description = "Master username for PostgreSQL"
  type        = string
}

variable "password" {
  description = "Master password for PostgreSQL"
  type        = string
  sensitive   = true
}

variable "engine_version" {
  description = "Version of the PostgreSQL engine"
  type        = string
}

variable "instance_class" {
  description = "Instance class (e.g., db.t3.micro)"
  type        = string
}

variable "allocated_storage" {
  description = "Initial allocated storage (in GB)"
  type        = number
}

variable "max_allocated_storage" {
  description = "Maximum allocated storage (in GB)"
  type        = number
}

variable "storage_type" {
  description = "Storage type (e.g., gp2, gp3)"
  type        = string
}

variable "storage_encrypted" {
  description = "Whether to enable encryption"
  type        = bool
}

variable "publicly_accessible" {
  description = "Whether the RDS instance is publicly accessible"
  type        = bool
}

variable "multi_az" {
  description = "Enable multi-AZ deployment"
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
  description = "Enable auto minor version upgrades"
  type        = bool
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot on deletion"
  type        = bool
}

variable "deletion_protection" {
  description = "Enable deletion protection"
  type        = bool
}

variable "tags" {
  description = "Common tags to apply"
  type        = map(string)
}
