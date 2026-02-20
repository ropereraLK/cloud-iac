# cloud-iac
This repository provisions and maintains cloud infrastructure services across environments using Terraform.

```
cloud-iac/
│
├── modules/
│   ├── vpc/
│   ├── eks/
│   ├── ecs/
│   ├── rds/
│   ├── dynamodb/
│   ├── s3/
│   └── iam/
│
├── live/
│   ├── dev/
│   │   ├── network/
│   │   ├── platform/
│   │   └── services/
│   │       ├── service-a/
│   │       └── service-b/
│   │
│   ├── staging/
│   │   ├── network/
│   │   ├── platform/
│   │   └── services/
│   │
│   └── prod/
│       ├── network/
│       ├── platform/
│       └── services/
│
├── global/
│   ├── iam/
│   └── organization/
│
├── versions.tf
└── README.md
```