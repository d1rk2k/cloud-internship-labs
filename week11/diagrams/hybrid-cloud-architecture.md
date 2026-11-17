# Week 11 – Hybrid Cloud Architecture

```mermaid
flowchart TB
    TF["Terraform - Infrastructure as Code"]

    subgraph WIN["Windows 11 Laptop"]
        subgraph WSL["Ubuntu 26.04 - WSL2"]
            subgraph OS["OpenStack Private Cloud"]
                NET["Neutron Private Network<br/>10.11.0.0/24"]
                ROUTER["week11-router"]
                VM1["week11-vm01<br/>10.11.0.94"]
                VM2["terraform-vm01<br/>10.11.0.250"]
                VM3["terraform-vm02<br/>10.11.0.71"]

                NET --- ROUTER
                NET --- VM1
                NET --- VM2
                NET --- VM3
            end
        end

        subgraph DOCKER["Docker Desktop"]
            subgraph LS["LocalStack - Simulated AWS S3"]
                S3A["Primary Bucket<br/>week11-multicloud-demo"]
                S3B["Backup Bucket<br/>week11-cloud-backup"]
            end
        end
    end

    GD["Google Drive<br/>Week11-Cloud-Backup"]
    LOCAL["Local Test Files"]
    RCLONE["rclone - Data Synchronization"]

    TF -.->|"Provisions 2 VMs"| VM2
    TF -.->|"Provisions"| VM3
    TF -.->|"Provisions S3 Bucket"| S3A

    LOCAL -->|"Upload via rclone"| S3A
    S3A -->|"Bucket-to-bucket sync"| S3B
    S3A -->|"Cross-provider sync via rclone"| GD

    RCLONE -.-> S3A
    RCLONE -.-> S3B
    RCLONE -.-> GD
```

## Architecture Description

This project demonstrates a hybrid-cloud lab environment using OpenStack, Terraform, LocalStack, rclone, and Google Drive.

### Private Cloud
OpenStack runs inside Ubuntu WSL2 and provides virtual machines, networking, and routing.

### Infrastructure Automation
Terraform provisions two OpenStack virtual machines and an S3-compatible bucket in LocalStack.

### Simulated AWS Storage
LocalStack runs through Docker Desktop and provides simulated AWS S3 storage.

### Data Synchronization
rclone synchronizes files from local storage to LocalStack S3, between LocalStack buckets, and from LocalStack S3 to Google Drive.

### Data Integrity
SHA-256 checksums and rclone verification confirm that the synchronized files match.

### Limitation
LocalStack persistence across container restarts was not functioning reliably during testing. Terraform and rclone were used to restore the resources.
