variable "vm_type" {
    default = "t2.micro"
 
}
variable "ami_id" {
    default = null // If you don't want to pass the value otherwise it would give error while passing module
  
}

variable "ec2_subnet" {
    default = null
  
}

variable "key_name" {

  default = "aws"
  
}

variable "public_key" {
  default = null
  
}

variable "user_data" {
  default = null
  
}

variable "ec2_az" {
  default = null
  
}

variable "vpc_id" {
default = null

  }
variable "map_ports" {
  default = {
  ssh = {
      from_port = 22
      protocol = "tcp"
      cidr_block = ["0.0.0.0/0"]
    }
}
}
// Resource creation block
resource "random_string" "this" {
special = false
length = 6
lower = true
upper = false
  
}

resource "aws_key_pair" "this" {
  key_name   = "${var.key_name}-${random_string.this.result}"
   public_key = var.public_key
  }
  
resource "aws_security_group" "this" {
  name = "${var.key_name}-${random_string.this.result}"
  vpc_id = var.vpc_id
  dynamic "ingress" {
    for_each = var.map_ports // Passing Values with Map
    content {
    from_port        = ingress.value.from_port
    to_port          = ingress.value.from_port
    protocol         = ingress.value.protocol
    cidr_blocks      = ingress.value.cidr_block
    }
}
}
resource "aws_instance" "main" {
  ami = var.ami_id
  instance_type = var.vm_type
  availability_zone = var.ec2_az
  //security_groups = [aws_security_group.main.id]
  vpc_security_group_ids = [aws_security_group.this.id] 
  user_data = var.user_data
  key_name = aws_key_pair.this.key_name
  subnet_id = var.ec2_subnet
  tags = { Name = "myvm" , owner = "raman" }
  }
  
