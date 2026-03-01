# Policy

Policies define **allowed scope** for AWS resources in this repo. They act as company/team guardrails: Terraform (or CI) uses these rules to limit what can be created—for example, blocking instance types like `m5.xlarge` and only allowing approved types (e.g. `t3.micro`, `t3.small`) for EC2.

## Purpose

- **Consistency** – All environments follow the same high-level rules.
- **Safety** – Prevent expensive or non-compliant resources (e.g. large instance types, restricted regions).
- **Clarity** – Single place to see what is allowed for each service.

## Directory structure

```
policy/
├── Policy_README.md    # This file
└── ec2.tf             # EC2 policy (e.g. allowed instance types)
```

Add one file per service (e.g. `rds.tf`, `s3.tf`) when you need more policies. Add `env/` (e.g. `env/dev/ec2.tf`) only when you have environment-specific overrides.

## Example: EC2 policy

`ec2.tf` defines allowed instance types in `local.ec2_policy.allowed_instance_types`:

- **Allowed:** `t3.micro`, `t3.small`
- **Blocked:** anything else (e.g. `m5.xlarge`) unless added to the policy.

Use this list in infra (e.g. pick an allowed type in `DevSetUpT3Micro.tf`) or enforce in CI (Conftest, OPA, Sentinel).

## How to use policies

1. **Define** – Add or edit `.tf` files under `policy/` with `locals` that describe allowed options (instance types, AMIs, regions, etc.).
2. **Reference** – From infra, use allowed values (e.g. `instance_type = "t3.micro"`) and keep them in sync with policy.
3. **Enforce** – Optionally add CI checks that reject plans that violate policy.

## Adding a new policy

- **New service** – Add `policy/<service>.tf` (e.g. `policy/rds.tf`) with a `locals` block for that service’s rules.
- **Env-specific overrides** – When needed, add `policy/env/<env>/<service>.tf` (e.g. `policy/env/dev/ec2.tf`).
