resource "aws_security_group" "web" {
    description = "Allow public inbound traffic"
    vpc_id      = "${aws_vpc.main.id}"
    name = "scjenkins"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "Web"
  }
}

resource "aws_instance" "default" {
  ami                         = "${var.ami-aws-ubuntu}"
  instance_type               = "t2.micro"
  key_name                    = "${var.key-name}"
  subnet_id                   = "${aws_subnet.private_a.id}"
  security_groups      = ["${aws_security_group.web.id}"]
  count                       = "${var.instance_count}"
  source_dest_check           = false
  associate_public_ip_address = true

  user_data = "${file("script.sh")}"

  tags = {
    Name = "Jenkins Machine"
  }
}

