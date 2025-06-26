variable "vpc_id" {
  description = "VPC ID where RDS and security group will be created or used"
  type        = string
  default = "vpc-0b2e7e2387bf08301"
}

variable "subnet_ids" {
  description = "List of private subnet IDs for DB subnet group"
  type        = list(string)
  default = [ "subnet-034233dfae169f63f" ,"subnet-07d80237e1856b427" ]
}

variable "allowed_ports" {
  description = "List of allowed ingress ports for the RDS security group"
  type        = list(number)
  default = [ 5432 ]
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


variable "engine_version" {
  description = "PostgreSQL engine version"
  type        = string
  default = "16"
}

variable "instance_class" {
  description = "Instance class for the RDS instance (e.g., db.t3.micro)"
  type        = string
  default = "db.t3.micro"
}

variable "db_name" {
  description = "Initial database name to create"
  type        = string
  default = "postgresdb"
}

variable "username" {
  description = "Master username for the database"
  type        = string
  default = "postgres"
}

variable "password" {
  description = "Master password for the database"
  type        = string
  sensitive   = true
  default = "Postgres123"
}

variable "allocated_storage" {
  description = "Initial storage size in GB"
  type        = number
  default = 20
}

variable "max_allocated_storage" {
  description = "Maximum storage size in GB"
  type        = number
  default = 100
}

variable "storage_type" {
  description = "Storage type (e.g., gp2, gp3)"
  type        = string
  default = "gp2"
}

variable "storage_encrypted" {
  description = "Whether to enable encryption for the storage"
  type        = bool
  default = true
}

variable "publicly_accessible" {
  description = "Whether the DB instance is publicly accessible"
  type        = bool
  default = false
}

variable "multi_az" {
  description = "Whether to enable Multi-AZ deployment"
  type        = bool
  default = false
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
  default = false
}

variable "deletion_protection" {
  description = "Whether to enable deletion protection"
  type        = bool
  default = false
}



################################### Naming convention variables #########################################

variable "bu" {
  description = "Business unit name (e.g., BP, GURUKU). Max 6 characters."
  type        = string

  validation {
    condition     = length(var.bu) <= 6
    error_message = "The business unit name must be less than or equal to 6 characters."
  }
}

variable "program" {
  description = "Name of the program (e.g., OT, BP)."
  type        = string
}

variable "app" {
  description = "Application name (e.g., network, shared). Max 6 characters."
  type        = string

  validation {
    condition     = length(var.app) <= 6
    error_message = "The app name must be less than or equal to 6 characters."
  }
}

variable "env" {
  description = "Environment code: 'd' (dev), 'p' (prod), 'q' (qa), 's' (stage), 'g' (global)."
  type        = string

  validation {
    condition     = contains(["d", "p", "q", "s", "g"], var.env)
    error_message = "env must be one of 'd', 'p', 'q', 's', 'g'."
  }
}

variable "team" {
  description = "Team email responsible for the application (e.g., digitalops@gehealthcare.com)."
  type        = string
}

variable "region" {
  description = "AWS region (e.g., us-east-1, ap-south-1)."
  type        = string
  default = "us-east-1"
}

