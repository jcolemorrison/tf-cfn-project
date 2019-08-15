provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

provider "aws" {
  alias   = "uswest2"
  region  = "us-west-2"
  profile = "default"
}

resource "random_string" "instance_name" {
  length  = 8
  special = false
}


module "instance" {
  source             = "./modules/instance"
  instance_key_name  = "tf-us-east-1"
  instance_name      = "tf-instance"
  instance_allow_ssh = true
}

output "instance_ip" {
  value = module.instance.instance_public_ip
}

module "another_instance" {
  source             = "./modules/instance"
  instance_key_name  = "tf-us-east-1"
  instance_name      = "another-tf-instance"
  instance_allow_ssh = true
}

module "west_instance" {
  source             = "./modules/instance"
  instance_key_name  = null
  instance_name      = "tf-instance-${random_string.instance_name.result}"
  instance_allow_ssh = false

  providers = {
    aws = aws.uswest2
  }
}
