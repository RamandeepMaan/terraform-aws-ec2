terraform {
  required_version = "~>1.7.4" // terraform binary version which can execute these tf files.  
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ""5.38.0""
  module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.1.0"
} 
}
}
}
