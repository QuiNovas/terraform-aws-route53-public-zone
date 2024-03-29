variable "delegation_set_id" {
  default     = ""
  description = "The ID of the reusable delegation set whose NS records you want to assign to the hosted zone."
  type        = string
}

variable "name" {
  description = "This is the name of the hosted zone."
  type        = string
}

variable "record_set" {
  default     = []
  description = <<DESCRIPTION
A list of the records to add to the zone. Each entry is in the following format:
  {
    name    = "foo.com."
    type    = "A"
    records = "192.168.1.1"
    ttl     = "3600"
  }
DESCRIPTION
  type        = list(map(string))
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resources"
  type        = map(string)
  default     = {}
}