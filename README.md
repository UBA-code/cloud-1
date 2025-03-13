# Cloud-1

A DevOps project focused on deploying a web application on cloud infrastructure as part of the 42 school curriculum.

## Project Structure

```
.
├── .gitignore               # Git ignore file for excluding sensitive data
├── inventory.ini            # Ansible inventory file defining target hosts
├── playbooks/               # Ansible playbooks
│   ├── deploy_playbook.yaml # Playbook for deploying the web application
│   └── docker_playbook.yaml # Playbook for Docker configuration
├── scripts/                 # Utility scripts
│   └── renew_certificate.sh # Script for SSL certificate renewal
└── secrets/                 # Directory for storing sensitive information
    └── .env.example         # Example environment file template
```

## Project Overview

This project implements a web application deployment on cloud infrastructure using Ansible for configuration management and Docker for containerization. The deployment follows the requirements specified in the 42 subject, focusing on automation, security, and scalability.

## Prerequisites

- Cloud provider account (AWS/GCP/Azure)
- Ansible installed on control node
- SSH access to target servers
- Docker and Docker Compose (installed via playbooks)

## Setup and Deployment

### 1. Configure Inventory

Update the `inventory.ini` file with the IP addresses or hostnames of your target servers:

```ini
[myhosts]
15.237.214.130
15.236.239.28
```

### 2. Configure Environment Variables

Create your environment file from the example template:

```bash
cp secrets/.env.example secrets/.env
# Edit secrets/.env with your configuration
```

Note: The `.env` file is included in `.gitignore` to prevent committing sensitive information.

### 3. Install Docker and Dependencies

Run the Docker playbook to set up the container environment:

```bash
ansible-playbook -i inventory.ini playbooks/docker_playbook.yaml
```

### 4. Deploy the Application

Run the deployment playbook to set up the web application:

```bash
ansible-playbook -i inventory.ini playbooks/deploy_playbook.yaml
```

### 5. SSL Certificate Management

The project includes a certificate renewal script that can be configured with cron for automatic renewal:

```bash
./scripts/renew_certificate.sh
```

## Features

- **Containerized Deployment**: Application components run in Docker containers
- **Automated Configuration**: Ansible playbooks handle all configuration tasks
- **SSL Support**: Includes scripts for certificate management
- **Secrets Management**: Secure storage for sensitive information in `.env` files (not tracked by git)
- **Infrastructure as Code**: Complete infrastructure defined through code

## Project Requirements (42 School)

This project fulfills the following requirements from the 42 School subject:

- Deployment of a web application in a cloud environment
- Automation of the deployment process
- Implementation of proper security practices
- Use of containerization technology
- Configuration management through code

## Troubleshooting

If you encounter issues during deployment:

1. Check your inventory file for correct server information
2. Verify SSH connectivity to target servers
3. Check the Ansible logs for detailed error messages
4. Ensure all required ports are open in your cloud provider's firewall
5. Verify you've created and properly configured the `secrets/.env` file

## Extending the Project

You can enhance this project by:

- Adding monitoring and alerting
- Implementing a CI/CD pipeline
- Setting up load balancing for high availability
- Adding backup and restore functionality
