resource "aws_route53_zone" "zone" {
  delegation_set_id = var.delegation_set_id
  lifecycle {
    prevent_destroy = true
  }
  name = var.name
}

resource "aws_route53_record" "record" {
  count   = local.record_set_count
  name    = var.record_set[count.index]["name"]
  records = split(",", var.record_set[count.index]["records"])
  ttl     = lookup(var.record_set[count.index], "ttl", "300")
  type    = var.record_set[count.index]["type"]
  zone_id = aws_route53_zone.zone.zone_id
}

