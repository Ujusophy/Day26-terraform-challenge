variable "elb_name" {
  description = "Name of the ELB"
  default        = "elb1"
}

variable "availability_zones" {
  description = "The availability zones for the ELB"
  default     = ["us-east-1a", "us-east-1b"]
}
