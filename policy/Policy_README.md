# Policy

Policies define **allowed scope** for AWS resources in this repo. They act as company/team guardrails: Terraform (or CI) uses these rules to limit what can be created—for example, blocking instance types like `m5.xlarge` and only allowing approved types (e.g. `t3.micro`, `t3.small`) for EC2.

## Purpose

- **Consistency** – All environments follow the same high-level rules.
- **Safety** – Prevent expensive or non-compliant resources (e.g. large instance types, restricted regions).
- **Clarity** – Single place to see what is allowed for each service and environment.

## Directory structure

```
policy/
├── Policy_README.md          # This file
├── global/                   # Rules that apply to all resources, all environments
│   ├── globalPolicy.tf       # Company-wide AWS policy (all services)
│   └── ec2/
│       └── ec2-globalPolicy.tf   # EC2-specific policy for every environment
└── env/                      # Environment-specific overrides or additions
    ├── devPolicy.tf          # Policy for all resources in the Dev environment
    └── dev/
        └── ec2-devPolicy.tf  # EC2 policy for Dev only
```

## Scope by file

| File | Scope |
|------|--------|
| `global/globalPolicy.tf` | All AWS resources, all environments |
| `global/ec2/ec2-globalPolicy.tf` | All EC2 instances, all environments (e.g. allowed instance types) |
| `env/devPolicy.tf` | All resources in the Dev environment |
| `env/dev/ec2-devPolicy.tf` | EC2 only, Dev environment |

## Example: EC2 global policy

`global/ec2/ec2-globalPolicy.tf` defines allowed instance types as Terraform locals. These values are intended to be passed into the EC2 module (or validated in CI) so that only listed types can be used:

- **Allowed:** `t3.micro`, `t3.small`
- **Blocked:** anything else (e.g. `m5.xlarge`) unless added to the policy or overridden at environment level.

## How to use policies

1. **Define** – Add or edit `.tf` files under `policy/` with `locals` (or similar) that describe allowed options (instance types, AMIs, regions, etc.).
2. **Reference** – From infra (e.g. `infra/env/dev/`) or from the EC2 module, pass these values in as variables and validate (e.g. `precondition` or variable `validation` block).
3. **Enforce** – Optionally add CI checks (e.g. Conftest, OPA, or Sentinel) that reject plans that violate policy.

## Adding a new policy

- **Global for a service** – Add `policy/global/<service>/<service>-globalPolicy.tf` (e.g. `rds/rds-globalPolicy.tf`).
- **Per environment** – Add `policy/env/<env>/<service>-<env>Policy.tf` (e.g. `env/dev/ec2-devPolicy.tf`).
- Keep the same pattern: use `locals` (or a small set of variables) so infra or modules can consume them.
