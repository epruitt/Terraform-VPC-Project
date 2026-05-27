raw
Readme · MD

# Terraform VPC Project

A Terraform-based Infrastructure as Code (IaC) project for provisioning an AWS Virtual Private Cloud (VPC) and associated networking resources.

---

## Overview

This project uses [Terraform](https://www.terraform.io/) to define and deploy a production-ready AWS VPC environment. All infrastructure is declared as code using HashiCorp Configuration Language (HCL), enabling consistent, repeatable, and version-controlled cloud deployments.

---

## Repository Structure

```
Terraform-VPC-Project/
└── terraform-manifest/
    ├── version.tf           # Defines required Terraform version and AWS provider block
    ├── variables.tf      # Declares input variables used throughout the config
    ├── outputs.tf        # Defines output values like VPC ID, subnet IDs
    └── vpc.tf  # Variable values (environment-specific)
    └── datasources-and-locals.tf  # Contains AWS region data source and local values
```

---

## Resources Provisioned

This project provisions the following AWS networking resources:

- **VPC** – A logically isolated virtual network in AWS
- **Public Subnets** – Subnets with internet-accessible routing
- **Private Subnets** – Subnets isolated from direct internet access
- **Internet Gateway (IGW)** – Enables outbound internet access for public subnets
- **NAT Gateway (NAT)** – Enables private subnet to access the internet through an internet gateway with elastic IP address
- **Route Tables** – Custom routing rules for public and private subnets
- **Security Groups** – Inbound/outbound traffic rules for network resources

---

## Prerequisites

Before deploying, ensure you have the following installed and configured:

- [Terraform](https://developer.hashicorp.com/terraform/downloads) `>= 1.0`
- [AWS CLI](https://aws.amazon.com/cli/) configured with valid credentials
- An AWS account with sufficient IAM permissions to create VPC resources

---

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/epruitt/Terraform-VPC-Project.git
cd Terraform-VPC-Project/terraform-manifest
```

### 2. Initialize Terraform

```bash
terraform init
```

### 3. Initialize Terraform

```bash
terraform validate
```

### 4. Review the Execution Plan

```bash
terraform plan
```

### 5. Apply the Configuration

```bash
terraform apply
```

Type `yes` when prompted to confirm resource creation.

### 6. Destroy Resources (when done)

```bash
terraform destroy
```

---

## Variables

Key input variables can be customized in `terraform.tfvars` or passed via the command line:

| Variable         | Description                    | Default        |
| ---------------- | ------------------------------ | -------------- |
| `region`         | AWS region to deploy resources | `us-east-1`    |
| `vpc_cidr`       | CIDR block for the VPC         | `10.0.0.0/16`  |
| `public_subnet`  | CIDR for the public subnet     | `10.0.0.0/24`  |
| `private_subnet` | CIDR for the private subnet    | `10.0.10.0/24` |

> Update these values to match your environment before applying.

---

## Outputs

After a successful `terraform apply`, the following values will be output:

- `vpc_id` – The ID of the created VPC
- `public_subnet_id` – The ID of the public subnet
- `private_subnet_id` – The ID of the private subnet

---

## Technologies Used

- **Terraform** – Infrastructure as Code tooling
- **AWS** – Cloud provider
- **HCL** – HashiCorp Configuration Language

---

## Author

**epruitt** – [GitHub Profile](https://github.com/epruitt)

---
