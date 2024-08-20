terraform {
  required_version = "~>1.8"
  required_providers {
    digitalocean = {
      version = "~> 2.0"
      source  = "digitalocean/digitalocean"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}