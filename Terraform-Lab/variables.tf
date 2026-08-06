variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
}

variable "ami_id" {
  description = "Ubuntu AMI"
  type        = string
}

variable "instance_name" {
  description = "Instance Name"
  type        = string
}
