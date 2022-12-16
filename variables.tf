variable "vpc_name" {
  type        = string
  description = "vpc_name"
  default     = ""
}
variable "subnetwork_name" {
  type        = string
  description = "vpc_name"
  default     = ""
}
variable "nat_subnets" {
  type        = list(string)
  description = "vpc_name"
  default     = [""]
}
variable "project_name" {
  description = "GCP Project Name"
  default     = ""
}
variable "project_id" {
  description = "GCP Project Id"
  default     = ""
}
variable "primary_region" {
  description = "primary_region"
  default     = ""
}
variable "subnet_cidr_01" {
  type        = string
  description = "subnet_cidr_01"
  default     = ""
}
variable "subnet_cidr_02" {
  type        = string
  description = "subnet_cidr_02"
  default     = ""
}
variable "billing_account_id" {
  description = "Billing Account ID"
  default     = ""
}
variable "domain_names" {
  type        = list(string)
  description = "domain names"
  default     = [""]
}
variable "service_attachment_name" {
  type        = string
  description = "Service Attachment Name"
  default     = ""
}
variable "producer_forwarding_rule_name" {
  type        = string
  description = "Producer Forwarding Rule Name"
  default     = ""
}
variable "producer_forwarding_rule_ip_address" {
  type        = string
  description = "Producer Forwarding Rule IP Address"
  default     = ""
}
variable "producer_backend_service_name" {
  type        = string
  description = "Producer Forwarding Rule Name"
  default     = ""
}
variable "producer_health_check_name" {
  type        = string
  description = "Producer Health Check Name"
  default     = ""
}
variable "private_zone_name" {
  description = "DNS private zone name"
  default     = ""
}
variable "private_zone_dns_name" {
  description = "DNS private zone DNS name"
  default     = ""
}
variable "private_zone_a_record" {
  description = "A Record that maps to producer forwarding rule IP address"
  default     = ""
}
variable "vpc_id" {
  description = "VPC ID"
  default     = ""
}