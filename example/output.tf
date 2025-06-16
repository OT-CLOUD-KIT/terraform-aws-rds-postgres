output "db_endpoint" {
  value       = module.postgres_rds.db_instance_endpoint
  description = "PostgreSQL RDS endpoint"
}

output "db_instance_arn" {
  value       = module.postgres_rds.db_instance_arn
}

output "db_instance_identifier" {
  value       = module.postgres_rds.db_instance_identifier
}
