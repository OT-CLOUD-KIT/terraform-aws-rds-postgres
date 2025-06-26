create_sg                  = true
security_group_id       =  null

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
allowed_ports              = [5432, 5433]



################# Naming Convension #####################

random_alphanumeric_len = 4

bu       = "ot"
app      = "bp"
env      = "d"
resource = "database"

special = false
upper   = false
number  = true

gen_no_of_names = 1

team    = "infra"
program = "ot"
