AWS Infrastructure Provisioning using Terraform

Overview

This project provisions a production-style AWS infrastructure using Terraform for deploying a multi-tier application.

It includes networking, compute, load balancing, and security components designed for scalability, reliability, and maintainability.

---

Architecture Components

- VPC with public and private subnets
- Internet Gateway and NAT Gateway
- Route Tables for traffic management
- Security Groups for controlled access
- EC2 instances for application deployment
- Launch Template for standardized configuration
- Auto Scaling Group for high availability
- Application Load Balancer (ALB) for traffic distribution

---

Folder Structure

terraform/

├── provider.tf        # AWS provider configuration
├── variables.tf       # Input variables
├── outputs.tf         # Output values

├── network/           # VPC, subnets, IGW, NAT, routes
├── compute/           # EC2, Launch Template, Auto Scaling
├── security/          # Security Groups
├── loadbalancer/      # ALB and target groups
├── scripts/           # EC2 bootstrap script (app.sh)

---

Key Features

- Infrastructure as Code using Terraform
- Automated EC2 provisioning using user-data script
- Scalable setup using Auto Scaling Group
- Load balancing using AWS ALB
- Secure architecture with private subnets
- Organized file structure for better readability

---

Deployment Steps

1. Initialize Terraform
   terraform init

2. Validate configuration
   terraform validate

3. Preview changes
   terraform plan

4. Apply infrastructure
   terraform apply

---

Troubleshooting

Handled real-world issues such as:

- EC2 launch failures due to incorrect AMI or key pair
- Security group misconfiguration blocking access
- ALB health check failures due to wrong endpoints
- Auto Scaling instances not registering to target groups
- User-data script execution failures during instance startup

---

Important Notes

- Terraform state files are not included for security reasons
- Private key (.pem) files are excluded from version control
- Sensitive values should be handled securely

---

Technologies Used

- AWS (EC2, VPC, ALB, ASG, Security Groups)
- Terraform
- Linux & Shell Scripting

---
I worked on a project where I provisioned a complete AWS infrastructure using Terraform for a multi-tier application.

First, I designed the networking layer. I created a VPC with public and private subnets, configured an Internet Gateway for public access, and a NAT Gateway so private instances can access the internet securely. I also configured route tables to control traffic flow.

Then I moved to compute. I created EC2 instances using a Launch Template and automated the application setup using a user-data script. To make the system scalable and fault-tolerant, I configured an Auto Scaling Group.

For traffic distribution, I implemented an Application Load Balancer and attached it to the Auto Scaling Group using target groups. I also configured health checks to ensure only healthy instances receive traffic.

On the security side, I defined security groups to restrict access, allowing only required ports like HTTP and SSH.

I structured my Terraform code into separate folders like network, compute, security, and load balancer to improve readability and maintainability.

During implementation, I handled several real-world issues like EC2 launch failures, security group misconfigurations, ALB health check failures, and user-data script issues.

Overall, this project helped me understand how to design scalable and secure infrastructure using Terraform in a production-like setup.

Author

Sai Jagadeesh