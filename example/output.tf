output "rds_endpoint" {
  value = module.postgres_rds.rds_instance_endpoint
}

output "rds_security_group_id" {
  value = module.postgres_rds.security_group_id
}
