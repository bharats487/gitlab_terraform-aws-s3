# Terraform AWS S3 Project

This project manages AWS S3 buckets using Terraform with GitLab CI/CD pipelines for both staging and production environments.

## Project Structure

```
.
├── .gitlab-ci.yml       # GitLab CI/CD configuration
├── modules/             # Reusable Terraform modules
│   └── s3_bucket/       # S3 bucket module
├── environments/        # Environment-specific configurations
│   ├── staging/         # Staging environment
│   └── production/      # Production environment
└── README.md            # This file
```

## Prerequisites

1. GitLab account with a project created
2. AWS account with appropriate permissions
3. Terraform installed locally (for development)

## Setup Instructions

### 1. Configure GitLab CI/CD Variables

Go to your GitLab project: `Settings` > `CI/CD` > `Variables` and add:

- `AWS_ACCESS_KEY_ID` - Your AWS access key
- `AWS_SECRET_ACCESS_KEY` - Your AWS secret key
- `AWS_DEFAULT_REGION` - AWS region (e.g., us-east-1)

Mark these variables as `Protected` and `Masked` for security.

### 2. Branch Strategy

- `main` branch: Production environment
- `staging` branch: Staging environment
- Feature branches: Create from `staging` for development

### 3. Using the Pipelines

1. **Staging Environment**
   - Push to `staging` branch
   - Go to `CI/CD` > `Pipelines`
   - Run the pipeline manually
   - Approve each stage (init → validate → plan → apply)

2. **Production Environment**
   - Merge changes to `main` branch
   - Go to `CI/CD` > `Pipelines`
   - Run the pipeline manually
   - Approve each stage (init → validate → plan → apply)

## Development

### Local Development

1. Install Terraform (>= 1.0.0)
2. Configure AWS credentials:
   ```bash
   aws configure
   ```
3. Initialize Terraform:
   ```bash
   cd environments/staging
   terraform init
   ```
4. Plan and apply changes:
   ```bash
   terraform plan
   terraform apply
   ```

### Adding New Environments

1. Create a new directory under `environments/`
2. Copy and modify the configuration from an existing environment
3. Update `.gitlab-ci.yml` to include the new environment

## Security Considerations

- Never commit AWS credentials to version control
- Use IAM roles with least privilege
- Enable MFA for AWS accounts
- Regularly rotate access keys

## License

This project is licensed under the MIT License.
