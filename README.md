# aks-terraform-quickstart

This repository provides a quickstart guide for deploying an Azure Kubernetes Service (AKS) cluster using Terraform. Follow this guide to set up the necessary tools and infrastructure.

---

## Prerequisites

Before you begin, ensure you have the following tools installed and configured:

### 1. Install **Azure CLI**
Azure CLI is required to authenticate with your Azure subscription.

- [Azure CLI Installation Guide](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- After installation, log in to your Azure account:

```bash
# Connect and set Subscription Context in Azure
az login

# Verify current account login
az account show
```

