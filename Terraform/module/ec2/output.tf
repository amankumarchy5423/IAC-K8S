output "public-url" {
  value = "http://${aws_instance.aman-instance.public_ip}"
}

output "public_ip" {
  value = aws_instance.aman-instance.public_ip
}