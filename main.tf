provider "aws" {
  region     = "us-east-1n"
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}

resource "aws_db_instance" "postgres" {
  identifier             = "my-postgres-db"
  engine                 = "postgres"
  engine_version         = "15"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  storage_type           = "gp2"
  username               = "postgres"
  password               = "postgres"
  parameter_group_name   = "default.postgres15"
  publicly_accessible    = true
  skip_final_snapshot    = true

  vpc_security_group_ids = ["sg-0c74eb2fad61f0001"]
  db_subnet_group_name    = "rdsa-postgresql-db-subnet-group"
}

output "rds_endpoint" {
  value = aws_db_instance.postgres.endpoint
}
