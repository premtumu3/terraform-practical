provider "aws" {
region = "ap-south-1a"
}

resource "aws_instance" "one" {
ami = "ami-0c4a668b99e68bbde"
instance_type = "t3.micro"
key_name = "NEWKEY"
vpc_security_group_ids = [aws_security_group.five.id]
availability_zone = "ap-south-1a"
user_data = <<EOF

#! /bin/bash
sudo -i
yum install httpd -y
systemctl start httpd 
chkconfig httpd on
echo " Hai this is  raham web server 1" > /var/www/html/index.html

EOF

tags = {
Name = "web-server -1"
}
}

resource "aws_instance" "two" {
ami = "ami-0c4a668b99e68bbde"
instance_type = "t3.micro"
key_name = "NEWKEY"
vpc_security_group_ids = [aws_security_group.five.id]
availability_zone = "ap-south-1b"
user_data = <<EOF

#! /bin/bash
sudo -i
yum install httpd -y
systemctl start httpd
chkconfig httpd on
echo " Hai this is web raham server 2" > /var/www/html/index.html

EOF

tags = {
Name = "web-server -2"
}
}

resource "aws_instance" "three" {
ami = "ami-0c4a668b99e68bbde"
instance_type = "t3.micro"
key_name = "NEWKEY"
vpc_security_group_ids = [aws_security_group.five.id]
availability_zone = "ap-south-1a"
user_data = <<EOF

#! /bin/bash
sudo -i
yum install httpd -y
systemctl start httpd
chkconfig httpd on
echo " Hai this is  raham app server 1" > /var/www/html/index.html

EOF

tags = {
Name = "app-server -1"
}
}

resource "aws_instance" "four" {
ami = "ami-0c4a668b99e68bbde"
instance_type = "t3.micro"
key_name = "NEWKEY"
vpc_security_group_ids = [aws_security_group.five.id]
availability_zone = "ap-south-1b"
user_data = <<EOF

#! /bin/bash
sudo -i
yum install httpd -y
systemctl start httpd
chkconfig httpd on
echo " Hai this is app raham app server 1" > /var/www/html/index.html

EOF

tags = {
Name = "app-server -1"
}
}

resource "aws_security_group" "five" {
ingress {
from_port = 22
to_port = 22
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
ingress {
from_port = 80
to_port = 80
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
engress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}

aws "aws_s3_bucket" "six" {
bucket = "bucket.premtumu3.k8s.local"
}

resource "aws_iam_user" "seven" {
for_each = var.user_names
name = each.value
}

variable "user_names" {
description = "*"
type = set(string)
default = ["user1","user2","user3","user4"]
}
resource "aws.ebs.volume" "eight" {
availability_zone = "ap-south-1a"
size = 40
tags = {
Name = "ebs-volume"
}
}































