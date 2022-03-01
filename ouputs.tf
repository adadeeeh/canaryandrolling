output "aws_region" {
  description = "AWS region"
  value       = var.region
}

output "public_subnets" {
  description = "Public subnets"
  value       = module.vpc.public_subnets
}

output "web_sg_id" {
  description = "Security Group"
  value       = module.web_sg.security_group_id
}

output "tg_blue_arn" {
  description = "ALB target group ARN"
  value       = aws_lb_target_group.blue.arn
}

output "tg_green_arn" {
  description = "ALB target group ARN"
  value       = aws_lb_target_group.green.arn
}

output "lb_dns_name" {
  value = module.alb.lb_dns_name
}