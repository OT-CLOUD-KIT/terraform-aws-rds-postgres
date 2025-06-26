module "postgres_rds" {
  source = "git@github.com:OT-CLOUD-KIT/terraform-aws-rds-postgres.git?ref=feature"

  # VPC and subnet setup
  vpc_id            = var.vpc_id
  subnet_ids        = var.subnet_ids
  allowed_ports     = var.allowed_ports

  # Security group setup
  create_sg         = var.create_sg
  security_group_id = var.security_group_id

  # Naming and Tagging
  bu                = var.bu
  program           = var.program
  app               = var.app
  team              = var.team
  env               = var.env

  
  # RDS Configuration
  db_name                    = var.db_name
  username                   = var.username
  password                   = var.password
  engine_version             = var.engine_version
  instance_class             = var.instance_class
  allocated_storage          = var.allocated_storage
  max_allocated_storage      = var.max_allocated_storage
  storage_type               = var.storage_type
  storage_encrypted          = var.storage_encrypted
  publicly_accessible        = var.publicly_accessible
  multi_az                   = var.multi_az
  backup_retention_period    = var.backup_retention_period
  backup_window              = var.backup_window
  maintenance_window         = var.maintenance_window
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  skip_final_snapshot        = var.skip_final_snapshot
  deletion_protection        = var.deletion_protection

  # Standardized tags
  # tags = module.standard_tags.tags
}

module "naming" {
  source   = "git@github.com:OT-CLOUD-KIT/terraform-aws-naming.git?ref=dev"
  bu       = var.bu
  env      = var.env
  app      = var.app
  resource = var.resource
}

module "standard_tags" {
  source = "git@github.com:OT-CLOUD-KIT/terraform-aws-standard-tagging.git?ref=dev"

  bu      = var.bu
  program = var.program
  app     = var.app
  team    = var.team
  region  = var.region
  env     = var.env
}
