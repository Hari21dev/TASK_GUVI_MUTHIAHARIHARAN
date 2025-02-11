provider "aws" {
  region = "us-east-1"
  alias  = "us-east-1"
}

provider "aws" {
  region = "us-west-2"
  alias  = "us-west-2"
}

resource "aws_instance" "nginx_us_east_1" {
  provider = aws.us-east-1
  ami           = "ami-0c55b159cbfafe1f0" 
  instance_type = "t2.micro"
  key_name      = "hari.pem" 

  tags = {
    Name = "nginx-us-east-1"
  }

  user_data = <<-EOF
    #!/bin/bash
    apt update
    apt install -y nginx
    systemctl start nginx
    systemctl enable nginx
  EOF
}

resource "aws_instance" "nginx_us_west_2" {
  provider = aws.us-west-2
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name      = "hari.pem" 

  tags = {
    Name = "nginx-us-west-2"
  }

  user_data = <<-EOF
    #!/bin/bash
    apt update
    apt install -y nginx
    systemctl start nginx
    systemctl enable nginx
  EOF
}
