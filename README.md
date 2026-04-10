## SimpleTimeService

## Purpose
SimpleTimeService is a lightweight Node.js microservice that returns the current timestamp and the IP address of the visitor in JSON format.

The application is containerized using Docker and deployed on AWS infrastructure provisioned with Terraform.

---

## Architecture Choice

This project uses a VM-based deployment architecture.

Reasons for choosing this architecture:

- Simple and easy to implement for a single microservice.
- Docker ensures portability and consistent runtime environment.
- Infrastructure is fully automated using Terraform.
- The application runs on a VM in a private subnet for better security.
- A public Application Load Balancer exposes the service to the internet.

---

## Architecture Overview

Internet  
   │  
   │  
Application Load Balancer (Public Subnet)  
   │  
   │  
EC2 Instance (Private Subnet)  
   │  
   │  
Docker Container  
   │  
SimpleTimeService (Node.js)

---

## Architecture Details

- The EC2 instance is deployed in a private subnet and does not have a public IP.
- A NAT Gateway allows the instance to pull the Docker image from Docker Hub.
- The Application Load Balancer is deployed in public subnets to accept internet traffic.
- The load balancer forwards HTTP requests to the application running on the VM.

---

## Prerequisites

Before deployment, ensure the following tools are installed and configured:

- Terraform
- AWS CLI configured with credentials
- Docker
- Docker Hub account
- EC2 Key Pair available in AWS

## Docker Image

The container image is published on Docker Hub and can be pulled using:

```bash
docker pull komal0116/simpletimeservice:latest
```

Docker Hub Profile:
https://hub.docker.com/repository/docker/komal0116/simpletimeservice

## Running the Application Locally

Build the Docker image:
```bash
docker build -t simple-time-service .
```

Run the container:
```bash
docker run -p 3000:3000 simple-time-service
```

Access the service:
http://localhost:3000

## Infrastructure Deployment

Navigate to the Terraform directory:
```bash
cd terraform
```

Initialize Terraform:
```bash
terraform init
```

Preview the infrastructure:
```bash
terraform plan
```

Apply the configuration:
```bash
terraform apply
```

---

## Accessing the Service

After Terraform deployment completes, it will output the Application Load Balancer DNS name.

DNS hit on browser
alb_dns_name = "sts-lb-189622874.ap-south-1.elb.amazonaws.com" 

---

## Security Considerations

- The Docker container runs as a non-root user.
- The EC2 instance is placed in a private subnet.
- Public traffic is handled only through the Application Load Balancer.
- Infrastructure managed using Terraform Infrastructure as Code
