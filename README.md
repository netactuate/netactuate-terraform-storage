# netactuate-terraform-storage

Terraform module for provisioning storage resources on NetActuate's global edge network.
Deploys an S3-compatible bucket, object store, block storage namespace, and block volume
with a single `terraform apply`.

## Prerequisites

- **Terraform 1.0+** or **OpenTofu**
- A NetActuate API key ([portal.netactuate.com/account/api](https://portal.netactuate.com/account/api))

### Install Terraform

**macOS:**
```bash
brew install terraform
```

**Linux:**
```bash
# Using tfenv
git clone https://github.com/tfutils/tfenv.git ~/.tfenv
echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.bashrc
tfenv install latest
tfenv use latest
```

Or download the binary directly from [terraform.io/downloads](https://www.terraform.io/downloads).

**Windows:**
```powershell
winget install Hashicorp.Terraform
```

Or use WSL2 with the Linux instructions above.

## What It Deploys

- **S3-compatible bucket** — public bucket with S3 API access
- **Object store** — general-purpose object storage
- **Block storage namespace** — block storage pool with connection endpoints
- **Block storage volume** — individual block volume

**Important:** Storage locations differ from compute locations. Use
`data.netactuate_storage_locations` to discover available locations. Current storage
locations include: RDU, AMS, SJC, DFW, LHR, FRA, SCL, HKG, SIN, DXB, SYD. Note that
LAX is **not** a storage location.

## Configuration

### Step 1: Copy the example tfvars

```bash
cp terraform.tfvars.example terraform.tfvars
```

**Never commit `terraform.tfvars`** — it contains your API key and is gitignored.

### Step 2: Fill in your values

| Variable | Type | Description | Default |
|----------|------|-------------|---------|
| `api_key` | string | NetActuate API key (sensitive) | — |
| `location` | string | Storage location code | `"SJC"` |
| `capacity` | number | Storage capacity in TB | `2` |

## Usage

```bash
# Initialize providers
terraform init

# Preview what will be created
terraform plan

# Create all storage resources
terraform apply

# View available storage locations
terraform output storage_locations

# View bucket endpoints
terraform output bucket_endpoints

# View bucket access key (sensitive)
terraform output -raw bucket_access_key
```

## Outputs

| Output | Description |
|--------|-------------|
| `storage_locations` | All available storage locations from the data source |
| `bucket_id` | S3-compatible bucket ID |
| `bucket_endpoints` | S3 API endpoints for the bucket |
| `bucket_access_key` | S3 access key for the bucket (sensitive — use `terraform output -raw`) |
| `object_store_id` | Object store ID |
| `object_store_endpoints` | Object store connection endpoints |
| `block_namespace_id` | Block storage namespace ID |
| `block_namespace_pool` | Block storage pool name |
| `block_namespace_endpoints` | Block storage iSCSI/NVMe-oF endpoints |
| `block_volume_id` | Block storage volume ID |
| `block_volume_endpoints` | Block volume connection endpoints |

The `bucket_access_key` output is marked sensitive. Use `terraform output -raw bucket_access_key`
to retrieve it. Bucket endpoints provide the S3-compatible URL for use with `aws s3` CLI,
`s3cmd`, or any S3 SDK.

## Teardown

```bash
terraform destroy
```

This removes all storage resources and stops billing.

## AI-Assisted (Claude Code / Cursor / Copilot)

```
Provision NetActuate storage with Terraform:

- API Key: <YOUR_API_KEY>
- Location: SJC
- Capacity: 2 TB

Please:
1. Copy terraform.tfvars.example to terraform.tfvars and fill in values
2. Run terraform init && terraform apply
3. Show me the bucket_endpoints output
4. Show me the bucket_access_key
```

## Need Help?

- NetActuate support: support@netactuate.com
- [NetActuate API Documentation](https://www.netactuate.com/docs/)
- [Terraform NetActuate Provider](https://registry.terraform.io/providers/netactuate/netactuate/latest)
- [NetActuate Portal](https://portal.netactuate.com)
