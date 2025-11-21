# CryptoPulse-app – End-to-End AWS + GitHub OIDC DevOps Project

CryptoPulse is a production-ready static crypto insights application built with an enterprise-grade AWS architecture, full CI/CD automation using GitHub Actions, and secure deployments using OIDC (no long-lived AWS keys).

This project demonstrates real-world DevOps + Cloud Architecture capabilities: IaC, automated deployments, monitoring, secure IAM role assumption, and global static site delivery.

🌐 Live Demo

CryptoPulse-app Live App (GitHub Pages)
https://cloud-architect-emma.github.io/cryptopulse-app/

The app now runs on GitHub Pages (CloudFront disabled in the latest update).
Still fully available for cloning, learning, customisation, and DevOps demonstrations.

## Get Started Page Added
New UI page: get-started.html
New components & improved onboarding flow.

**Architecture Overview**

The project demonstrates a full production-like AWS deployment workflow:

AWS S3 — static hosting (initial deployment model)

AWS CloudFront — CDN distribution (previously used; still included in Terraform setup for demonstration)

AWS IAM + OIDC — secure GitHub authentication

AWS CloudWatch — logging, metrics, alarms

Terraform — IaC for AWS

GitHub Actions — full CI/CD automation

GitHub Pages — latest hosting platform for public demo

**Architecture Diagram**

📁 **For more images, open the screenshots folder**.

New UI Pages Added (Update)

The repository UI now includes:

get-started.html (new)

Internal navigation updates

Refreshed layout, colours, and onboarding steps

📁 **All screenshots of the new UI are located in**:
screenshots/

CI/CD Pipeline (AWS OIDC — No Access Keys Required)

This project uses GitHub Actions + AWS IAM OIDC to deploy securely:

No AWS IAM Secrets

GitHub issues short-lived JWT tokens

Pipeline assumes IAM role

S3 sync + CloudFront invalidation (where applicable)

Even though the live demo uses GitHub Pages, the CI pipeline remains AWS-ready.

Workflow Includes

Code validation

Build + Upload to S3

Optional CloudFront invalidation

Error handling

Rollback safety

**YAML workflow**:
.github/workflows/deploy.yml

Terraform infra:
terraform/

**Tech Stack**
Frontend
HTML
CSS
JavaScript

**AWS**
S3
CloudFront
IAM
CloudWatch
SNS (optional alerts)
Route 53 (health checks)

## DevOps
GitHub Actions
OIDC Authentication

**Project Structure**
.
├── index.html
├── crypto.html
├── get-started.html     ← new update
├── assets/
├── styles/
├── scripts/
├── terraform/
├── .github/
│   └── workflows/
│       └── deploy.yml
└── screenshots/
        ├── OIDC App.gif
        └── *.png (new UI screens)

## How to Deploy This Yourself
1. Clone the Repo
git clone https://github.com/Cloud-Architect-Emma/cryptopulse-app.git
cd cryptopulse-app

2. Modify the UI (optional)

All pages are pure HTML/CSS/JS — very easy to edit or restyle.

3. Deploy AWS Infrastructure (optional)
cd terraform
terraform init
terraform apply

4. Push Code → Auto Deployment

GitHub Actions automatically deploys to S3 (if enabled)
or updates GitHub Pages (current live hosting).

## Monitoring & Observability

CloudWatch Metrics

CloudWatch Logs

SNS Notifications

Route 53 Health Checks

Error tracking & latency metrics

## Contributing

Want to improve the UI, animations, architectural setup, or CI pipeline?

Fork the repo

Open a PR

Add enhancements

**Author**

Emmanuela
Cloud Architect & DevOps Engineer
GitHub: https://github.com/Cloud-Architect-Emma

⭐ Support the Project

If this repo helps you, please star it.
It improves visibility for other DevOps/Cloud learners.
