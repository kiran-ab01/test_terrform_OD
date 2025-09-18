export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=true
terraform init
terraform plan -out=tfplan
terraform apply -auto-approve tfplan
