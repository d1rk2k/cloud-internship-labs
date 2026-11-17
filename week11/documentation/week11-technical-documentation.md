# Week 11 – Multi-Cloud and Hybrid Cloud Architecture

## 1. Project Overview

This project demonstrates the deployment and management of a hybrid cloud lab environment using OpenStack, Terraform, LocalStack, rclone, and Google Drive.

The private cloud infrastructure was deployed using OpenStack through DevStack on Ubuntu 26.04 running inside Windows Subsystem for Linux 2 (WSL2).

Terraform was used to automate virtual machine provisioning and the creation of S3-compatible storage resources.

LocalStack was used to simulate AWS S3 services locally, while Google Drive served as an external cloud storage destination.

## 2. Project Objectives

- Understand multi-cloud and hybrid cloud architectures.
- Deploy and configure an OpenStack private cloud.
- Provision virtual machines using Terraform.
- Simulate AWS S3 storage using LocalStack.
- Synchronize files between storage destinations using rclone.
- Verify data integrity using SHA-256 checksums.
- Document the final cloud architecture.

## 3. Tools and Technologies

| Tool | Purpose |
|------|---------|
| Ubuntu 26.04 | Linux operating system |
| WSL2 | Linux virtualization environment |
| OpenStack | Private cloud platform |
| DevStack | OpenStack deployment automation |
| Terraform | Infrastructure as Code |
| Docker Desktop | Container management |
| LocalStack | AWS S3 simulation |
| AWS CLI | S3 API interaction |
| rclone | File synchronization |
| Google Drive | External cloud storage |
| GitHub | Version control |

## 4. Infrastructure Architecture

The architecture consists of three main components.

### 4.1 OpenStack Private Cloud

OpenStack provides virtual machine infrastructure and virtual networking.

The following instances were deployed:

| Instance | Private IP | Provisioning Method |
|----------|------------|---------------------|
| week11-vm01 | 10.11.0.94 | OpenStack CLI |
| terraform-vm01 | 10.11.0.250 | Terraform |
| terraform-vm02 | 10.11.0.71 | Terraform |

The instances use the CirrOS operating system and the m1.tiny flavor.

The private network uses the 10.11.0.0/24 address range.

A virtual router connects the private network to OpenStack's external network.

The week11-vm01 instance was assigned floating IP 172.24.4.84.

### 4.2 LocalStack S3 Storage

LocalStack provides an AWS S3-compatible environment running inside Docker Desktop.

Two storage buckets were created:

- week11-multicloud-demo
- week11-cloud-backup

Terraform manages the primary S3 bucket.

The backup bucket was created using the AWS CLI.

### 4.3 Google Drive Integration

Google Drive was configured as an external storage destination using rclone.

The Week11-Cloud-Backup folder contains synchronized copies of the test files.

## 5. Implementation

### Day 1 – Environment Setup

Installed and configured Ubuntu WSL2, Git, Terraform, rclone, and supporting packages.

Created the GitHub repository structure for the internship activities.

### Day 2 – OpenStack Deployment

Deployed OpenStack using DevStack.

Configured a private network, subnet, router, and floating IP.

Created the week11-vm01 virtual machine using OpenStack CLI.

Verified the instance through the Horizon dashboard.

### Day 3 – Terraform Automation

Configured the OpenStack Terraform provider.

Created Terraform configuration files:

- main.tf
- variables.tf
- outputs.tf

Provisioned two OpenStack virtual machines using Terraform.

Verified Terraform state and confirmed that the infrastructure matched its configuration.

### Day 4 – Multi-Cloud Simulation

Deployed LocalStack Community 3.8.1 using Docker Desktop.

Configured Terraform's AWS provider to use the LocalStack endpoint.

Created an S3-compatible bucket using Terraform.

Verified the bucket using the AWS CLI.

### Day 5 – Cloud Storage Synchronization

Configured rclone for LocalStack S3 and Google Drive.

Uploaded three test files to LocalStack S3.

Synchronized files between two LocalStack buckets.

Synchronized files from LocalStack S3 to Google Drive.

Verified file integrity using SHA-256 checksums and rclone.

### Day 6 – Hybrid Cloud Mini Project

Verified the existing infrastructure.

Restored OpenStack virtual machines after a shutdown.

Recreated missing LocalStack storage resources using Terraform and the AWS CLI.

Restored test files and verified their integrity.

Prepared the architecture diagram and technical documentation.

## 6. Testing and Verification

### OpenStack Verification

All three OpenStack virtual machines were verified in ACTIVE status.

### Terraform Verification

Terraform successfully managed two OpenStack instances.

A Terraform plan confirmed that no infrastructure changes were required.

### Storage Synchronization

Three test files were synchronized.

Total data transferred: 110 bytes.

### Data Integrity

rclone verification reported:

- 0 differences found
- 3 matching files

This confirmed that the synchronized files had identical contents.

## 7. Challenges and Solutions

### DevStack Installation Issues

During deployment, Apache encountered permission errors when accessing the Python virtual environment.

The issue was resolved by correcting directory traversal permissions and restarting Apache.

### OpenStack Networking

The floating IP was initially unreachable.

The external bridge was enabled, and host-side networking was configured to establish connectivity.

### LocalStack Licensing

The latest LocalStack image required license activation.

LocalStack Community 3.8.1 was used instead.

### LocalStack Persistence

LocalStack S3 resources disappeared after container restarts.

Persistence was enabled, but the issue continued.

Terraform and rclone were used to restore the required resources.

## 8. Conclusion

The Week 11 project demonstrated the deployment of a private cloud using OpenStack and infrastructure automation using Terraform.

The project also demonstrated simulated AWS S3 storage using LocalStack and cross-provider file synchronization to Google Drive.

Through these activities, practical experience was gained in virtual machine provisioning, cloud networking, Infrastructure as Code, data synchronization, and cloud architecture documentation.

The environment serves as a functional hybrid-cloud learning demonstration rather than a production deployment.
