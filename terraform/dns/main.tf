data "cloudflare_zones" "this" {
  name = var.root_domain
}

resource "cloudflare_dns_record" "a_record" {
  for_each = var.a_records
  zone_id  = data.cloudflare_zones.this.result[0].id
  name     = each.key
  type     = "A"
  content  = each.value
  ttl      = 1
  proxied  = false
}

resource "cloudflare_dns_record" "cname_record" {
  for_each = var.cname_records
  zone_id  = data.cloudflare_zones.this.result[0].id
  name     = each.key
  type     = "CNAME"
  content  = each.value
  ttl      = 1
  proxied  = false
}
