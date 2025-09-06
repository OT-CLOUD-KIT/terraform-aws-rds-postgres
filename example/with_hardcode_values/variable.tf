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
  type = string
default = "us-east-1"
}