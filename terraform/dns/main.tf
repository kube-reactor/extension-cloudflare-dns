data "cloudflare_zones" "this" {
  filter {
    name = var.root_domain
  }
}

resource "cloudflare_record" "a_record" {
  for_each = var.a_records
  zone_id  = data.cloudflare_zone.this.id
  name     = each.key
  type     = "A"
  content  = each.value
  ttl      = 1
  proxied  = false
}

resource "cloudflare_record" "cname_record" {
  for_each = var.cname_records
  zone_id  = data.cloudflare_zone.this.id
  name     = each.key
  type     = "A"
  content  = each.value
  ttl      = 1
  proxied  = false
}
