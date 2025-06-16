resource "aws_db_subnet_group" "this" {
  name       = var.db_subnet_group_name
  subnet_ids = var.subnet_ids

  tags = merge(var.tags, {
    Name = var.db_subnet_group_name
  })
}

resource "aws_db_instance" "postgres" {
  identifier               = var.identifier
  engine                   = "postgres"
  engine_version           = var.engine_version
  instance_class           = var.instance_class
  allocated_storage        = var.allocated_storage
  max_allocated_storage    = var.max_allocated_storage
  storage_type             = var.storage_type
  storage_encrypted        = var.storage_encrypted
  publicly_accessible      = var.publicly_accessible
  multi_az                 = var.multi_az
  db_name                  = var.db_name
  username                 = var.username
  password                 = var.password
  db_subnet_group_name     = aws_db_subnet_group.this.name
  vpc_security_group_ids   = var.security_group_ids
  backup_retention_period  = var.backup_retention_period
  backup_window            = var.backup_window
  maintenance_window       = var.maintenance_window
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  skip_final_snapshot      = var.skip_final_snapshot
  deletion_protection      = var.deletion_protection

  tags = merge(var.tags, {
    Name = var.identifier
  })
}
