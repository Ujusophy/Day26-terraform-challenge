module "ec2" {
  source = "./modules/ec2"
  ami           = "ami-0a0e5d9c7acc336f1"  
  instance_type = "t2.micro"
  instance_count = 2
}

module "elb" {
  source = "./modules/elb"
  elb_name           = "my-elb"
  availability_zones = ["us-east-1a", "us-east-1b"]  
}

module "asg" {
  source = "./modules/asg"
  desired_capacity = 2
  max_size         = 5
  min_size         = 1
  subnet_ids       = ["subnet-0b80d1672c1d6452a", "subnet-0846e4641e585a3df"] 
  ami              = "ami-0a0e5d9c7acc336f1"  
  instance_type    = "t2.micro"
  security_group_id = module.ec2.web_sg_id 
  asg_name          = "asg1"
}

