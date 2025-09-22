output "rds_instance_endpoint" {
  value = aws_db_instance.postgres.endpoint
}

output "security_group_id" {
  value = var.create_sg ? aws_security_group.rds_sg[0].id : var.security_group_id
}