resource "aws_route53_record" "Nisar" {
  for_each        = aws_instance.Shabu-Terraform-Instance
  zone_id         = var.zone_id
  name            = each.key == "frontend" ? var.domain_name : "${each.key}.${var.domain_name}"
  type            = "A"
  ttl             = 300
  records         = each.key == "frontend" ? [each.value.public_ip] : [each.value.private_ip]
  allow_overwrite = true
}