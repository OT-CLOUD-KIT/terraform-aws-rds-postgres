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
}

variable "username" {
  description = "Master username for the DB"
  type        = string
}

variable "password" {
  description = "Master password for the DB"
  type        = string
  sensitive   = true
}

variable "engine_version" {
  description = "Version of the PostgreSQL engine"
  type        = string
}

variable "instance_class" {
  description = "Instance type (e.g., db.t3.micro)"
  type        = string
}

variable "allocated_storage" {
  description = "Initial allocated storage in GB"
  type        = number
}

variable "max_allocated_storage" {
  description = "Maximum allocated storage in GB"
  type        = number
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



################### Naming Convention Inputs ###################

variable "env" {
  description = "Environment short name (d, p, q, s, g)"
  type        = string
  validation {
    condition     = contains(["d", "p", "q", "s", "g"], var.env)
    error_message = "env must be one of: d, p, q, s, g"
  }
}

variable "bu" {
  description = "Business unit (max 5 characters)"
  type        = string
  validation {
    condition     = length(var.bu) <= 5
    error_message = "Business unit name must be <= 5 characters"
  }
}

variable "app" {
  description = "Application name (max 6 characters)"
  type        = string
  validation {
    condition     = length(var.app) <= 6
    error_message = "App name must be <= 6 characters"
  }
}

variable "program" {
  description = "Program name (e.g., ot-cloud-kit, otx)"
  type        = string
}

variable "resource" {
  description = "Resource name (max 8 characters)"
  type        = string
  default     = ""
  validation {
    condition     = length(var.resource) <= 8
    error_message = "Resource name must be <= 8 characters"
  }
}

variable "team" {
  description = "Team owner email (e.g., digitalops@gehealthcare.com)"
  type        = string
}

variable "region" {
  description = "AWS region (e.g., us-east-1)"
  type        = string
  default     = "us-east-1"
}

################### Optional Random Name Generator ###################

variable "enabled_features" {
  description = "List of enabled optional features"
  type        = list(string)
  default     = []
}

variable "create" {
  description = "Whether to create resources"
  type        = bool
  default     = true
}

variable "random_alphanumeric_len" {
  description = "Random string length (1 to 4)"
  type        = number
  default     = 2
  validation {
    condition     = var.random_alphanumeric_len >= 1 && var.random_alphanumeric_len <= 4
    error_message = "Length must be between 1 and 4"
  }
}

variable "special" {
  description = "Include special characters in names"
  type        = bool
  default     = false
}

variable "upper" {
  description = "Include uppercase characters in names"
  type        = bool
  default     = false
}

variable "number" {
  description = "Include numbers in generated names"
  type        = bool
  default     = true
}

variable "gen_no_of_names" {
  description = "Number of names to generate"
  type        = number
  default     = 1
}
