variable "region" {
  default = "us-east-1"
}

variable "ami-aws-ubuntu" {
  default = "ami-07ebfd5b3428b6f4d"
}

variable "key-name" {
  default = "awsuni"
}

variable "instance_count" {
  default = 1
}

variable "network" {
  default = "10.5.0.0/16"
}
