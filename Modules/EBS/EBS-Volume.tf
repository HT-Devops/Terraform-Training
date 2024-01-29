resource "aws_ebs_volume" "Vol1" {
  availability_zone = "us-east-1a"
  size              = var.size

  tags = {
    Name = "HelloWorld"
  }
}
