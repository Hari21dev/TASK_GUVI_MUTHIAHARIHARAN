#  us-east-1 (N. Virginia)
provider "aws" {
  region = "us-east-1"
  alias  = "us-east-1"
}

#  us-west-2 (Oregon)
provider "aws" {
  region = "us-west-2"
  alias  = "us-west-2"
}

resource "aws_instance" "us_east_instance" {
  provider = aws.us-east-1
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name      = "hari.pem"

  tags = {
    Name = "us-east-1-instance"
  }

  user_data = <<-EOF
    #!/bin/bash
    apt update -y
    apt install -y nginx
    systemctl start nginx
    systemctl enable nginx
  EOF
}

# EC2 instance in us-west-2 region
resource "aws_instance" "us_west_instance" {
  provider = aws.us-west-2
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name      = "hari.pem" 

  tags = {
    Name = "us-west-2-instance"
  }

  user_data = <<-EOF
    #!/bin/bash
    apt update -y
    apt install -y nginx
    systemctl start nginx
    systemctl enable nginx
  EOF
}
