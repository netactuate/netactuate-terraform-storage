output "storage_locations" {
  description = "All available storage locations"
  value       = data.netactuate_storage_locations.available
}

output "bucket_id" {
  description = "S3-compatible bucket ID"
  value       = netactuate_storage_bucket.bucket.id
}

output "bucket_endpoints" {
  description = "S3-compatible bucket endpoints"
  value       = netactuate_storage_bucket.bucket.endpoints
}

output "bucket_access_key" {
  description = "S3-compatible bucket access key"
  value       = netactuate_storage_bucket.bucket.access_key
  sensitive   = true
}

output "object_store_id" {
  description = "Object store ID"
  value       = netactuate_storage_object_store.object.id
}

output "object_store_endpoints" {
  description = "Object store endpoints"
  value       = netactuate_storage_object_store.object.endpoints
}

output "block_namespace_id" {
  description = "Block storage namespace ID"
  value       = netactuate_storage_block_namespace.block_ns.id
}

output "block_namespace_pool" {
  description = "Block storage namespace pool"
  value       = netactuate_storage_block_namespace.block_ns.pool
}

output "block_namespace_endpoints" {
  description = "Block storage namespace endpoints"
  value       = netactuate_storage_block_namespace.block_ns.endpoints
}

output "block_volume_id" {
  description = "Block storage volume ID"
  value       = netactuate_storage_block_volume.block_vol.id
}

output "block_volume_endpoints" {
  description = "Block storage volume endpoints"
  value       = netactuate_storage_block_volume.block_vol.endpoints
}
