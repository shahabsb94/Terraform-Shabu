# resource "aws_route53_record" "Nisar" {
#   # for_each        = aws_instance.Shabu-Terraform-Instance
#   count = length(var.instances)
#   zone_id         = var.zone_id
#   name            = each.key == "frontend" ? var.domain_name : "${each.key}.${var.domain_name}"
#   type            = "A"
#   ttl             = 300
#   records         = each.key == "frontend" ? [each.value.public_ip] : [each.value.private_ip]
#   allow_overwrite = true
# }

  #   resource "aws_route53_record" "Nisar" {
  #   count = length(var.instances)
  #   zone_id = var.zone_id
  #   name    = var.instances[count.index] == "frontend" && var.environment == "prod" ? var.domain_name : "${var.instances[count.index]}-${var.environment}.${var.domain_name}"
  #   type    = "A"
  #   ttl     = 1
  #   records = [var.instances[count.index] == "frontend" && var.environment == "prod" ? aws_instance.expense[count.index].public_ip : aws_instance.expense[count.index].private_ip] #list type
  #   allow_overwrite = true
  # }