resource "google_dns_managed_zone" "private_zone" {

  name        = var.private_zone_name
  project     = var.project_id
  dns_name    = var.private_zone_dns_name
  description = "private DNS zone"

  visibility = "private"

  private_visibility_config {
    networks {
      network_url = var.vpc_id
    }
  }
}

resource "google_dns_record_set" "internal_lb" {

  name         = "${var.private_zone_a_record}.${google_dns_managed_zone.private_zone.dns_name}"
  project      = var.project_id
  type         = "A"
  ttl          = 300
  managed_zone = google_dns_managed_zone.private_zone.name

  rrdatas = [google_compute_forwarding_rule.psc_ilb_target_service.ip_address]
}