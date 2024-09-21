variable "desired_capacity" {
  description = "Desired number of instances in the ASG"
  type        = number
}

variable "max_size" {
  description = "Maximum number of instances in the ASG"
  type        = number
}

variable "min_size" {
  description = "Minimum number of instances in the ASG"
  type        = number
}

variable "subnet_ids" {
  description = "List of subnet IDs for the ASG"
  type        = list(string)
}

variable "ami" {
  description = "AMI ID for the launch configuration"
  default      = "ami-0a0e5d9c7acc336f1"
}

variable "instance_type" {
  description = "Instance type for the launch configuration"
  default      = "t2-micro"
}

variable "security_group_id" {
  description = "The security group ID to associate with the launch configuration"
  type        = string
}

variable "asg_name" {
  description = "Name of the Auto Scaling Group"
  default       = "asg1"
}
