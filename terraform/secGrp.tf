resource "aws_security_group" "react_sg" {
  name        = "react-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  tags = {
    Name = "react-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_myIp" {
  security_group_id = aws_security_group.react_sg.id
  cidr_ipv4         = "102.88.108.189/32"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.react_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.react_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.react_sg.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}