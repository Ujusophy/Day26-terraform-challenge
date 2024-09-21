variable "instance_count" {
  description = "Number of EC2 instances"
  type        = number
  default     = 2
}

variable "ami" {
  description = "AMI ID for the EC2 instances"
  default      = "ami-0a0e5d9c7acc336f1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "elb_name" {
  description = "Name of the ELB"
  default      = "web"
}

variable "desired_capacity" {
  description = "Desired number of instances in the ASG"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Maximum number of instances in the ASG"
  type        = number
  default     = 5
}

variable "min_size" {
  description = "Minimum number of instances in the ASG"
  type        = number
  default     = 1
}

variable "subnet_ids" {
  description = "List of subnet IDs for the ASG"
  default       = ["subnet-0b80d1672c1d6452a", "subnet-0846e4641e585a3df"]
}
