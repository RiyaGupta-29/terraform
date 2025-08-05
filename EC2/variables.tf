variable "aws_region" {
  default = "ap-south-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "Name of the existing AWS key pair"
}

variable "ami_id" {
  description = "Amazon Linux 2 AMI"
  default     = "ami-0d0ad8bb301edb745"
}