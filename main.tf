resource "google_compute_service_attachment" "psc_ilb_service_attachment" {
  name        = var.service_attachment_name
  region      = var.primary_region
  project     = var.project_id

  # domain_names             = var.domain_names
  enable_proxy_protocol    = false
  connection_preference    = "ACCEPT_AUTOMATIC"
  nat_subnets              = var.nat_subnets
  target_service           = google_compute_forwarding_rule.psc_ilb_target_service.id
}

resource "google_compute_forwarding_rule" "psc_ilb_target_service" {
  name    = var.producer_forwarding_rule_name
  region  = var.primary_region
  project = var.project_id

  load_balancing_scheme = "INTERNAL"
  ip_address            = var.producer_forwarding_rule_ip_address
  backend_service       = google_compute_region_backend_service.producer_service_backend.id
  all_ports             = true
  network               = var.vpc_name
  subnetwork            = var.subnetwork_name
}

resource "google_compute_region_backend_service" "producer_service_backend" {
  name    = var.producer_backend_service_name
  project = var.project_id
  region  = var.primary_region

  health_checks = [google_compute_health_check.producer_service_health_check.id]
}

resource "google_compute_health_check" "producer_service_health_check" {
  name    = var.producer_health_check_name
  project = var.project_id

  check_interval_sec = 1
  timeout_sec        = 1
  tcp_health_check {
    port = "80"
  }
}

    