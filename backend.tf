# S3 Bucket for Terraform State
resource "aws_s3_bucket" "terraform_state" {
  bucket = "techynurse-terraform-state-bucket" 
  acl    = "private"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true  # Prevent accidental deletion of the bucket
  }

  tags = {
    Name        = "TerraformStateBucket"
    Environment = "dev"
  }
}


resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "LockID"
    type = "S"
  }
  hash_key = "LockID"

  tags = {
    Name        = "TerraformLocksTable"
    Environment = "dev"
  }
}

#terraform {
 # backend "s3" {
 #   bucket         = "techynurse-terraform-state-bucket"  
 #   key            = "terraform/state"
 #   region         = "us-east-1"  # Update to match your desired region
#    dynamodb_table = "terraform-locks"  # Use the table name directly
#    encrypt        = true
#  }
#}
