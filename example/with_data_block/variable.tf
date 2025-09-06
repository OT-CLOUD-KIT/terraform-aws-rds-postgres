################### Security Group Configuration ###################

variable "create_sg" {
  type        = bool
  default     = true
  description = "Whether to create a new security group"
  
}

variable "security_group_id" {
  type        = string
  default     = null
  description = "Existing security group ID (used if create_sg is false)"
}



variable "db_name" {
  description = "Initial database name"
  type        = string
  default = "postgresdb"

}

variable "username" {
  description = "Master username for the DB"
  type        = string
  default = "postgres"
}

variable "password" {
  description = "Master password for the DB"
  type        = string
  sensitive   = true
  default = "Postgres123"
}

variable "engine_version" {
  description = "Version of the PostgreSQL engine"
  type        = string
  default = "16"
}

variable "instance_class" {
  description = "Instance type (e.g., db.t3.micro)"
  type        = string
  default = "db.t3.micro"

}

variable "allocated_storage" {
  description = "Initial allocated storage in GB"
  type        = number
  default = 16
}

variable "max_allocated_storage" {
  description = "Maximum allocated storage in GB"
  type        = number
  default = 100
}

variable "storage_type" {
  description = "Storage type (e.g., gp2, gp3)"
  type        = string
}

variable "storage_encrypted" {
  description = "Enable storage encryption"
  type        = bool
}

variable "publicly_accessible" {
  description = "Make RDS publicly accessible"
  type        = bool
}

variable "multi_az" {
  description = "Enable Multi-AZ deployment"
  type        = bool
}

variable "backup_retention_period" {
  description = "Backup retention period in days"
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
  description = "Enable automatic minor version upgrades"
  type        = bool
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot when deleting the DB"
  type        = bool
}

variable "deletion_protection" {
  description = "Enable deletion protection"
  type        = bool
}

variable "allowed_ports" {
  description = "List of allowed ports for inbound access"
  type        = list(number)
}



variable "env" {
  type = string
  default = "dev"
  
}

variable "owner" {
  type = string
  default = "opstree"
}

variable "app" {
  type = string
  default = "otcloud-kit"
  
}

variable "region" {
  type =  string
  default = "us-east-1"
  
}