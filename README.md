# Terraform & Github Actions 🏗️

This repository is a reference for using Terraform Cloud and Github Actions.

## Github Actions

The Github Actions in this project are configured to validate, plan, and deploy the infrastructure contained in the terraform files. The actions need to connect to the Terraform Cloud, and therefore the only required environment variable for this repository is the `TF_API_TOKEN` that Terraform Cloud provides.

This token can be generated on Terraform Cloud.

The actions are configured to validate and plan all infrastructure whenever a pull request is opened to the main branch.

The infrastructure will only be applied when the pull request is actually merged into main.

The output of these actions are automatically added as a comment to the pull request, allowing users to see the results of their commits in Github, without having to open Terraform Cloud's dashboard.

## Terraform Code

This Terraform code uses Amazon's provider to create an EC2 instance in the default VPC. In order for Terraform Cloud to validate with AWS, you must provide the appropriate variables to the TF Cloud workspace. Those variables are `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` and can be generated in the AWS Console.
