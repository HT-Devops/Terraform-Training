provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "firstEC2" {
  ami           = "ami-079db87dc4c10ac91"
  instance_type = var.instance_type
  key_name = "tf-pem-key"
  availability_zone = "us-east-1a"

  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("./tf-pem-key.pem")
    host     = self.public_ip
  }

    provisioner "remote-exec" {
    on_failure = continue
    inline = [ 
      "sudo yum install java-1.8.0 wget -y",
      "sudo yum install -y maven"
     ]
}
}
