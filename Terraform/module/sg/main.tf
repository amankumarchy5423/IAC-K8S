# Security grops for the subnets
resource "aws_security_group" "sg-common" {
  name        = " aman-sg"
  description = "Allow inbound traffic on port 22,443 and 80"
  vpc_id      = var.vpc_id

  tags = {
    Name = "aman-sg"
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port   = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port   = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port   = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress{
    description = "ALL"
    from_port   = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

# Security grop for the kubernetes
resource "aws_security_group" "k8s-sg" {
  vpc_id      = var.vpc_id
  name        = "k8s-sg"
  description = "Allow inbound traffic on port 22,443 and 80"

  tags = {
    Name = "k8s-sg"
  }
  ingress {
    description = "Kubernetes-API-server"
    from_port = 6443
    to_port = 6443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Kubelet-API"
    from_port = 10250
    to_port = 10250
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "kube-scheduler"
    from_port = 10259
    to_port = 10259
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "kube-controller-manager"
    from_port = 10257
    to_port = 10257
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "etcd-server-client-API"
    from_port = 2379
    to_port = 2380
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

# Security group for the worker nodes of k8s
resource "aws_security_group" "k8s-worker" {
    vpc_id      = var.vpc_id
    name        = "k8s-worker-sg"
    tags = {
      Name = "k8s-worker-sg"
    }

    ingress {
    description = "Kubelet-API"
    from_port = 10250
    to_port = 10250
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    ingress {
        description = "NodePort-Services"
        from_port = 30000
        to_port = 32767
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

# UDP port For Backend
resource "aws_security_group" "k8s-udp" {
    vpc_id      = var.vpc_id
    name        = "k8s-udp-sg"
    tags = {
        Name = "k8s-udp-sg"
        }
        ingress {
            description = "UDP port for backend"
            from_port = 8285
            to_port = 8285
            protocol = "udp"
            cidr_blocks = ["0.0.0.0/0"]
            }
        ingress {
            description = "UDP port for backend"
            from_port = 8472
            to_port = 8472
            protocol = "udp"
            cidr_blocks = ["0.0.0.0/0"]
            }

}