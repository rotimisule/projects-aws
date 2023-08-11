##main code
resource "aws_instance" "ec2" {
  ami               = "ami-024e6efaf93d85776"
  instance_type     = var.type
  availability_zone = var.az
  security_groups   = [aws_security_group.project20.name]
  user_data         = file("script.sh")
  tags = {
    Name = var.name
  }
}
/*
Security group creation using vpc
*/
resource "aws_security_group" "project20" {
  name   = "Allow SSH/TCP Traffic"
  vpc_id = var.vpc_id
  //ingress = inboud rules for our security group
  ingress {
    from_port = 22



    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  //egress = outbound rules for the security group
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
//S3 bucket for the Jenkins Artifacts
resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket
  tags = {
    Name = "Jenkins project week20"
  }
}