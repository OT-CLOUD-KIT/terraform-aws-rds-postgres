output "db_instance_endpoint" {
  value       = aws_db_instance.postgres.endpoint
  description = "PostgreSQL RDS endpoint"
}

output "db_instance_arn" {
  value       = aws_db_instance.postgres.arn
  description = "ARN of the RDS instance"
}

output "db_instance_identifier" {
  value       = aws_db_instance.postgres.identifier
}
