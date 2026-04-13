terraform {
  required_providers {
    netactuate = {
      source  = "netactuate/netactuate"
      version = ">= 0.2.5"
    }
  }
  required_version = ">= 1.0"
}

provider "netactuate" {
  api_key = var.api_key
}

data "netactuate_storage_locations" "available" {}

resource "netactuate_storage_bucket" "bucket" {
  label              = "tf-bucket-${var.location}"
  location           = var.location
  capacity           = var.capacity
  private            = false
  enable_auto_scaling = false
}

resource "netactuate_storage_object_store" "object" {
  label              = "tf-object-${var.location}"
  location           = var.location
  capacity           = var.capacity
  enable_auto_scaling = false
}

resource "netactuate_storage_block_namespace" "block_ns" {
  label              = "tf-block-ns-${var.location}"
  location           = var.location
  capacity           = var.capacity
  enable_auto_scaling = false
}

resource "netactuate_storage_block_volume" "block_vol" {
  label    = "tf-block-vol-${var.location}"
  location = var.location
  capacity = var.capacity
}
