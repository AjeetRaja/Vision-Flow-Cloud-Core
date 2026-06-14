

# Vision-Flow: Industrial Safety AI Cloud Core

An enterprise-grade, production-ready Infrastructure-as-Code (IaC) project designed for automating industrial safety auditing. This repository provisions a secure, isolated cloud network to ingest and store computer vision safety violation images (e.g., workers without protective helmets/jackets).

## 🏗️ System Architecture

- **Custom VPC:** Isolated network environment (`10.0.0.0/16`) protecting core business integrity.
- **Public Subnet:** Hosts the Ubuntu compute layer running the FastAPI AI core engine.
- **AWS S3 Storage:** A hardened, highly secure storage bucket with disabled public access and enforced bucket ownership for maximum security compliance.
- **AWS Security Groups:** Restricts traffic strictly to SSH (Port 22) for administration and HTTP (Port 8000) for camera data ingestion.

## 🛠️ Infrastructure Technologies Used

- **Cloud Provider:** AWS (Amazon Web Services)
- **Infrastructure as Code (IaC):** Terraform (~> 5.0)
- **Compute:** EC2 (Ubuntu Server 22.04 LTS)
- **Storage:** Amazon S3 (Object Storage)
- **Architecture Strategy:** Modular Monolith & Backend Integrity

## 🚀 Deployment Lifecycle

To provision this infrastructure, use the standard Terraform lifecycle workflow:
1. `terraform init` - Initialize provider plugins.
2. `terraform plan` - Preview the infrastructure execution blueprint.
3. `terraform apply` - Provision resources on live AWS cloud environment.


## Architectural Diagram
<img width="1024" height="559" alt="image" src="https://github.com/user-attachments/assets/772420b4-8b72-416a-88eb-01f7eb21614f" />
