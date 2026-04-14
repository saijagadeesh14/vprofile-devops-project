##Used to display important values after terraform apply

output "alb_dns_name" {
  value = aws_lb.vprofile_alb.dns_name
}

