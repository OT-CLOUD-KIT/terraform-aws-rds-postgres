vpc_id     = "vpc-0123456789abcdef0"

subnet_ids = [
  "subnet-aaa111bbb222ccc33",
  "subnet-ddd444eee555fff66"
]

allowed_ports              = [5432]
create_sg                  = true
sg_name                    = "dev-postgres-sg"
security_group_id          = null

db_subnet_group_name       = "postgres-db-subnet-group-01"
identifier                 = "db-postgres"
db_name                    = "postgresdb"
username                   = "postgres"
password                   = "Postgres123"
engine_version             = "16"
instance_class             = "db.t3.micro"
allocated_storage          = 20
max_allocated_storage      = 100
storage_type               = "gp2"
storage_encrypted          = true
publicly_accessible        = false
multi_az                   = false
backup_retention_period    = 7
backup_window              = "03:00-04:00"
maintenance_window         = "sun:05:00-sun:06:00"
auto_minor_version_upgrade = true
skip_final_snapshot        = true
deletion_protection        = false

tags = {
  Environment = "dev"
  Team        = "Ninjas"
  Project     = "PostgreSQL"
}
