region                  = "us-east-1"
identifier              = "ntd-postgres"
db_name                 = "ntddb"
username                = "postgres"
password                = "Postgres123"
db_subnet_group_name    = "ntd-db-subnet-group"
subnet_ids              = ["subnet-08a2aa30dbc179a2b", "subnet-0a49bf4221b5f0107"]
security_group_ids      = ["sg-04fb2f273d8865af3"]
engine_version          = "16"
instance_class          = "db.t3.micro"
allocated_storage       = 20
max_allocated_storage   = 100
storage_type            = "gp2"
storage_encrypted       = true
publicly_accessible     = false
multi_az                = false
backup_retention_period = 7
backup_window           = "03:00-04:00"
maintenance_window      = "sun:05:00-sun:06:00"
auto_minor_version_upgrade = true
skip_final_snapshot     = true
deletion_protection     = false

tags = {
  Environment = "dev"
  Team        = "Ninjas"
  Project     = "NTD PostgreSQL"
}
