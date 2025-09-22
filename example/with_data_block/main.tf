
module "postgres_rds" {
  source = "git@github.com:OT-CLOUD-KIT/terraform-aws-rds-postgres.git?ref=feature"

  vpc_id                     = data.terraform_remote_state.network.outputs.vpc_id
  subnet_ids              = data.terraform_remote_state.network.outputs.private_subnets
  allowed_ports              = var.allowed_ports

  create_sg                  = var.create_sg
  security_group_id          = var.security_group_id


env = var.env
app = var.app
owner = var.owner
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

}


