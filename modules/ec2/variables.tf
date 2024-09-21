variable "instance_count" {
  description = "Number of EC2 instances"
  default       = 2
}

variable "ami" {
  description = "AMI ID for the EC2 instances"
  default      = "ami-0a0e5d9c7acc336f1"
}

variable "instance_type" {
  description = "EC2 instance type"
  default       = "t2-micro"
}
