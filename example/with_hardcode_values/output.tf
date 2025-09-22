output "rds_endpoint" {
  description = "PostgreSQL RDS instance endpoint"
  value       = module.postgres_rds.rds_instance_endpoint
}

output "rds_security_group_id" {
  description = "Security group ID used by the RDS instance"
  value       = module.postgres_rds.security_group_id
}
