resource "aws_security_group" "general_rules_sg" {
  name_prefix = "general-rules-"
  description = "some general rules"

  tags = {
    owner = var.attached_instance_name
  }
}

