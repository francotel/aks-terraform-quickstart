# Export all variables defined in the Makefile
.EXPORT_ALL_VARIABLES:

# Variables for Azure authentication
ARM_SUBSCRIPTION_ID ?= ABCDEF-1234-1234-abcd-XXXXXXXXXXX
KUBECONFIG = ./azurek8s

# HOW TO EXECUTE:
# - Initialize Terraform: make tf-init
# - Run PLAN: make tf-plan
# - Apply changes: make tf-apply
# - Destroy resources: make tf-destroy
# - Clean generated files: make clean

.PHONY: clean azure-login tf-init tf-plan tf-apply tf-destroy tf-output

# Azure login (opens browser for authentication)
azure-login:
	az login
	az account set --subscription $(ARM_SUBSCRIPTION_ID)

# Clean up Terraform artifacts
clean:
	rm -rf .terraform tfplan terraform.tfstate*

# Initialize Terraform
tf-init:
	terraform init -reconfigure -upgrade
	terraform validate

# Run Terraform plan
tf-plan: tf-init
	terraform fmt --recursive
	terraform plan  -out=tfplan

# Apply Terraform plan
tf-apply: tf-plan
	terraform apply -auto-approve tfplan

# Destroy Terraform-managed resources
tf-destroy:
	terraform destroy -auto-approve 

# Show Terraform outputs
tf-output:
	terraform output

# Generate kubeconfig and set it for kubectl
kubeconfig:
	@echo "Generating kubeconfig and setting it for kubectl..."
	@terraform output -raw kube_config > ./azurek8s
	@echo "KUBECONFIG set to ./azurek8s. You can now use kubectl to interact with your cluster."
	@echo "Validate Cluster AKS"
	@kubectl get nodes

# Genera un reporte de costos con Infracost
infracost: tf-plan
	infracost breakdown --path tfplan
