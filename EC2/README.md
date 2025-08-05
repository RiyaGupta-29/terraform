# EC2 Infrastructure with Terraform

This directory contains Terraform configuration files to provision and manage AWS EC2 instances with security groups, key pairs, and networking components.

## Overview

This project sets up a complete EC2 infrastructure including:
- **EC2 Instance**: Amazon Linux 2 with NGINX web server
- **Security Group**: Configured to allow HTTP (port 80) and SSH (port 22) access
- **User Data Script**: Automatically installs and starts NGINX on instance launch
- **Outputs**: Provides the public IP address of the instance

## Architecture

```
┌─────────────────────────────────────────┐
│          AWS Cloud                      │
│  ┌─────────────────────────────────┐   │
│  │     EC2 Instance                │   │
│  │  ┌─────────────────────────┐    │   │
│  │  │    NGINX Web Server     │    │   │
│  │  │    Port: 80             │    │   │
│  │  └─────────────────────────┘    │   │
│  └─────────────────────────────────┘   │
│  ┌─────────────────────────────────┐   │
│  │    Security Group               │   │
│  │  - HTTP: 0.0.0.0/0 (80)        │   │
│  │  - SSH: 0.0.0.0/0 (22)         │   │
│  └─────────────────────────────────┘   │
└─────────────────────────────────────────┘
```

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform installed (version 1.0+)
- An existing AWS key pair for SSH access

## Configuration

### Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `aws_region` | AWS region for deployment | `ap-south-1` |
| `instance_type` | EC2 instance type | `t2.micro` |
| `key_name` | Name of existing AWS key pair | *Required* |
| `ami_id` | Amazon Linux 2 AMI ID | `ami-0d0ad8bb301edb745` |

### Files Structure

```
EC2/
├── main.tf          # Main infrastructure resources
├── variables.tf     # Input variables definition
├── provider.tf      # AWS provider configuration
├── output.tf        # Output values
├── terraform.tfvars   # Variable values (not tracked in git)
└── README.md        # This documentation
```

## Usage

### 1. Configure AWS Credentials
```bash
aws configure
```

### 2. Set Variables
Create or edit `terraform.tfvars`:
```hcl
key_name = "your-key-pair-name"
```

### 3. Initialize Terraform
```bash
terraform init
```

### 4. Plan the Deployment
```bash
terraform plan
```

### 5. Apply the configuration:
   ```bash
   terraform apply
   ```

### 6. Access the NGINX server using the output public IP:
   ```
   http://<public_ip>
   ```

## Cleanup

To destroy the resources created by this configuration, run:
```bash
terraform destroy
