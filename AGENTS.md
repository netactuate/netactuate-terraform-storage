# netactuate-terraform-storage — AI Provisioning Context

Terraform module for NetActuate storage resources. Deploys an S3-compatible bucket,
object store, block namespace, and block volume in a single apply.

Give me: API key + location + capacity → storage resources provisioned with endpoints output.

## Important

Storage locations differ from compute locations. Use `data.netactuate_storage_locations`
to discover available locations. Available locations: RDU, AMS, SJC, DFW, LHR, FRA, SCL,
HKG, SIN, DXB, SYD. LAX is NOT a storage location.

## Required Inputs

| Input | Source | Example |
|-------|--------|---------|
| API key | portal.netactuate.com/account/api | `"abc123..."` |
| Location | Storage location code | `"SJC"` |
| Capacity | TB of storage | `2` |

## What to Do

1. Copy `terraform.tfvars.example` to `terraform.tfvars`
2. Fill in values (never commit `terraform.tfvars`)
3. Run:
   ```bash
   terraform init
   terraform apply
   ```
4. Get endpoints:
   ```bash
   terraform output bucket_endpoints
   terraform output -raw bucket_access_key
   terraform output block_namespace_endpoints
   ```

## Teardown

```bash
terraform destroy
```

## Common Errors

| Error | Fix |
|-------|-----|
| Provider not found | Run `terraform init` |
| API key invalid | Check `terraform.tfvars` — key must be whitelisted on portal |
| Location not found | Use a storage location (not compute) — check `terraform output storage_locations` |
| Capacity error | Capacity must be a positive number in TB |
