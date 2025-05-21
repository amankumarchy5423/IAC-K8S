
resource "aws_instance" "aman-instance" {
  ami = var.instance-ami
  instance_type = "t3.small"
  associate_public_ip_address = true
  subnet_id = var.subnet_id
  vpc_security_group_ids = var.security_groups

  root_block_device {
    volume_size = 20
    volume_type = "gp2"
  }

  tags = {
    Name = "kubectl-controlplane"
  }
}