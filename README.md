##VProfile End-to-End DevOps Project

Overview

This project demonstrates a complete DevOps workflow for deploying a multi-tier application using Terraform, Docker, and Kubernetes.

- Terraform is used for provisioning AWS infrastructure
- Docker is used for containerizing the application
- Kubernetes is used for orchestration and deployment

The application consists of:

- Application service (vProfile)
- Database (MariaDB)
- Cache (Memcached)
- Messaging system (RabbitMQ)

---

Architecture

- AWS infrastructure provisioned using Terraform
- Application containerized using Docker
- Deployed on Kubernetes cluster
- Internal communication handled using Kubernetes Services and DNS

## Project Structure

```
project/
│
├── terraform/
│   ├── network/
│   ├── compute/
│   ├── security/
│   ├── loadbalancer/
│   ├── scripts/
│   ├── provider.tf
│   ├── variables.tf
│   ├── outputs.tf
│
├── docker/
│   └── Dockerfile
│
├── kubernetes/
│   ├── app/
│   ├── db/
│   ├── cache/
│   ├── messaging/
│
└── README.md
```

Terraform (Infrastructure Setup)

- Created VPC with public and private subnets
- Configured Internet Gateway and NAT Gateway
- Implemented route tables and security groups
- Created EC2 instances using launch templates
- Configured Auto Scaling Group for scalability
- Provisioned Application Load Balancer

---

Docker (Containerization)

- Built custom Docker image using Tomcat
- Deployed application WAR file inside container
- Exposed port 8080 for application access

---

Kubernetes (Deployment)

- Created Deployments for:
  
  - vProfile application
  - MariaDB
  - Memcached
  - RabbitMQ

- Created Services for:
  
  - Internal communication (ClusterIP)
  - External access (LoadBalancer)

- Implemented:
  
  - Readiness probes
  - Liveness probes

---

Service Communication

Kubernetes DNS is used for service discovery.

Examples:

- mariadb → database service
- memcached → cache service
- rabbit → messaging service

---

Key Achievements

- Automated infrastructure provisioning using Terraform
- Designed modular Terraform structure
- Containerized application using Docker
- Deployed multi-tier architecture on Kubernetes
- Handled rollout updates and pod lifecycle management
- Troubleshot issues such as ImagePullBackOff and DNS resolution

---

How to Run

Terraform

cd terraform
terraform init
terraform apply

---

Kubernetes

kubectl apply -f kubernetes/

---

Future Improvements

- Implement CI/CD pipeline using Jenkins or GitHub Actions
- Use Helm charts for Kubernetes deployments
- Add monitoring using Prometheus and Grafana

---

Author

Sai Jagadeesh