resource "aws_security_group" "rds_sg" {
  count       = var.create_sg ? 1 : 0

  name        = "${local.base_name}-rds-sg"
  description = "Security group for PostgreSQL RDS"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.allowed_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    {
      Name = "${local.base_name}-rds-sg"
    },
    local.common_tags
  )
  }

resource "aws_db_subnet_group" "postgres_subnet_group" {
  name       = "${local.base_name}-db-subnet-group"
  subnet_ids = var.subnet_ids

tags = merge(
    {
      Name = "${local.base_name}-db-subnet-group"
    },
    local.common_tags
  )
  }

resource "aws_db_instance" "postgres" {
  identifier              = "${local.base_name}-postgres"
  engine                  = "postgres"
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  db_name                 = var.db_name
  username                = var.username
  password                = var.password
  db_subnet_group_name    = aws_db_subnet_group.postgres_subnet_group.name
  vpc_security_group_ids  = var.create_sg ? [aws_security_group.rds_sg[0].id] : [var.security_group_id]
  allocated_storage       = var.allocated_storage
  max_allocated_storage   = var.max_allocated_storage
  storage_type            = var.storage_type
  storage_encrypted       = var.storage_encrypted
  publicly_accessible     = var.publicly_accessible
  multi_az                = var.multi_az
  backup_retention_period = var.backup_retention_period
  backup_window           = var.backup_window
  maintenance_window      = var.maintenance_window
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  skip_final_snapshot     = var.skip_final_snapshot
  deletion_protection     = var.deletion_protection

  tags = merge(
    {
      Name = "${local.base_name}-postgres"
    },
    local.common_tags
  )
}
