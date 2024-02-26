terraform {
  required_version = "~>1.7.4" // terraform binary version which can execute these tf files.  
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.29.0"
    }
  }
}
