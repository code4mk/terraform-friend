# Terraform init.
terraform init

# Terraform format.
terraform fmt -recursive

# Root module terraform docs.
terraform-docs markdown table --output-file README.md --output-mode inject ./

# Add all module's directory.
modules=("vpc-module")

# Modules terraform docs creation.
for module in ${modules[@]}; do
  terraform-docs markdown table --output-file README.md --output-mode inject ./modules/${module}
done