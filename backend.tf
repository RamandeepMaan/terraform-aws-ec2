terraform {
backend "s3" {
    bucket         	   = "dhuri/tfstate"
    key              	   = "terraform.tfstate"
    region         	   = "ap-south-1"
    
  }

}
