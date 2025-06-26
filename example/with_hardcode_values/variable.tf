################### Networking and Infrastructure ###################

variable "vpc_id" {
  description = "VPC ID to use for the RDS instance"
  type        = string
  default = "vpc-0b2e7e2387bf08301"

}

variable "subnet_ids" {
  description = "List of private subnet IDs for the DB subnet group"
  type        = list(string)
  default = [ "subnet-034233dfae169f63f" ,"subnet-07d80237e1856b427" ]
}

variable "allowed_ports" {
  description = "List of allowed ports for inbound traffic"
  type        = list(number)
  default = [ 5432 ]

}

################### Security Group ###################

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
  default = "16"

}

variable "instance_class" {
  description = "Instance class (e.g., db.t3.micro)"
  type        = string
  default = "db.t3.micro"

}

variable "allocated_storage" {
  description = "Initial allocated storage (in GB)"
  type        = number
  default = 20

}

variable "max_allocated_storage" {
  description = "Maximum allocated storage (in GB)"
  type        = number
  default = 100

}

variable "storage_type" {
  description = "Storage type (e.g., gp2, gp3)"
  type        = string
  default = "gp2"
}

variable "storage_encrypted" {
  description = "Whether to enable encryption"
  type        = bool
  default = false
}

variable "publicly_accessible" {
  description = "Whether the RDS instance is publicly accessible"
  type        = bool
  default = false
}

variable "multi_az" {
  description = "Enable multi-AZ deployment"
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
  description = "Enable auto minor version upgrades"
  type        = bool
  default = false
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot on deletion"
  type        = bool
  default = false
}

variable "deletion_protection" {
  description = "Enable deletion protection"
  type        = bool
  default = false
}


################### Naming Convention Inputs ###################

variable "env" {
  description = "Environment short name. Must be one of: d (dev), p (prod), q (qa), s (stage), g (global)."
  type        = string
  validation {
    condition     = contains(["d", "p", "q", "s", "g"], var.env)
    error_message = "env must be one of 'd', 'p', 'q', 's', 'g'."
  }
}

variable "bu" {
  description = "Business unit name (e.g., pcs, ultrasound). Max 5 characters."
  type        = string
  validation {
    condition     = length(var.bu) <= 10
    error_message = "The business unit name must be less than or equal to 5 characters."
  }
}

variable "app" {
  description = "Application name (e.g., network, shared). Max 6 characters."
  type        = string
  validation {
    condition     = length(var.app) <= 10
    error_message = "The app name must be less than or equal to 6 characters."
  }
}

variable "program" {
  description = "Program name (e.g., ot-cloud-kit, otx)."
  type        = string
}

variable "resource" {
  description = "Resource name (e.g., eks, efs, ecr). Max 8 characters."
  type        = string
  default     = ""
  validation {
    condition     = length(var.resource) <= 15
    error_message = "The resource name must be less than or equal to 8 characters."
  }
}



variable "team" {
  description = "Team owner email (e.g., digitalops@gehealthcare.com)"
  type        = string
}

variable "region" {
  description = "AWS region (e.g., us-east-1)"
  type        = string
  default = "us-east-1"
}

################### Optional Random Name Generator ###################



variable "enabled_features" {
  description = "Optional features enabled for the module"
  type        = list(string)
  default     = []
}

variable "create" {
  description = "Controls if resources should be created (affects nearly all resources)"
  type        = bool
  default     = true
}

variable "random_alphanumeric_len" {
  description = "The length of random alphanumeric string desired. Min: 1, Max: 4."
  type        = number
  default     = 2
  validation {
    condition     = var.random_alphanumeric_len >= 1 && var.random_alphanumeric_len <= 4
    error_message = "The length must be between 1 and 4."
  }
}

variable "special" {
  description = "Include special characters in generated names"
  type        = bool
  default     = false
}

variable "upper" {
  description = "Include uppercase characters in generated names"
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

