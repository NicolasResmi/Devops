# Configure the Heroku provider
provider "heroku" {
  email   = "${var.heroku_email}"
  api_key = "${var.heroku_key}"
}

variable "heroku_email" {
  type = "string"
}

variable "heroku_key" {
  type = "string"
}