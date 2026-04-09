output "alb_dns_name" {
  value       = aws_lb.alb.dns_name
  description = "Public DNS of the ALB to access the app"
}