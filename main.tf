resource "aws_security_group" "my_SG" {
  name = var.tag_name

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}



resource "aws_instance" "web" {
  ami                    = "ami-0dbc3d7bc646e8516"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.my_SG.id]
  tags = {
    Name = "HelloWorld"
  }
}