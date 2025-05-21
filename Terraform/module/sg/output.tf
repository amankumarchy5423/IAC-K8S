output "sg-common-name" {
  value = aws_security_group.sg-common.id
}

output "k8s-sg-name" {
  value = aws_security_group.k8s-sg.id
}

output "k8s-worker-name" {
  value = aws_security_group.k8s-worker.id
}