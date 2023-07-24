terraform {
  backend "s3" {
    bucket         = "fiserv-terraform-state-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "jenkins_table"
  }
}
