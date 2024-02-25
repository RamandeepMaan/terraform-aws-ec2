locals {
my_region = "ap-south-1"
my_cidr = [ "192.168.10.0/24" ,"192.168.11.0/24" ,"172.16.5.0/24"] // vpc with list
my_tags = { Name = "your_vpc"}
}

resource "aws_vpc" "main"{
cidr_block = local.my_cidr[2]
tags = local.my_tags

}

resource "aws_vpc" "this" {
  cidr_block = local.my_cidr[1]
  tags = local.my_tags
}
resource "aws_vpc" "this1" {
  cidr_block = local.my_cidr[0]
  tags = local.my_tags
}


/* locals {
  
  my_region = "ap-south-1"
  vpc1={
    my_cidr="192.168.10.0/24"
    
  }
  vpc2={
    my_cidr="192.168.11.0/24"
  }
  
  tags = { Name = "your_vpc"}
  
}

resource "aws_vpc" "main" {
  cidr_block = local.vpc1.my_cidr
  tags = local.tags
}

resource "aws_vpc" "this" {
  cidr_block = local.vpc2.my_cidr
  tags = local.tags
}
 */
