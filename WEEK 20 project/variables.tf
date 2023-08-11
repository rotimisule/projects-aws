#name of your ec2 instance
variable "name" {
  type    = string
  default = "rotimi-Jenkins"
}
# your availability zone 
variable "az" {
  type    = string
  default = "us-east-2a"
}
#your default vpc 
variable "vpc_id" {
  type    = string
  default = "vpc-042c27a5f243b3ddd"
}
#Instance type
variable "type" {
  type    = string
  default = "t2.micro"
}
#s3 bucket, your globally unique bucket name
variable "bucket" {
  type    = string
  default = "rotimi-jenkins"
}