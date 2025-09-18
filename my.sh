
export AWS_ACCESS_KEY_ID=#AKIATJL7ZOJZUCRWKGOQ
export AWS_SECRET_ACCESS_KEY=#0XHyLbszmltbr+yAgg06ZrG+iseCApyEZ2Q+NggF
export AWS_DEFAULT_REGION=#us-east-1

export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=true

terraform init
terraform plan -out=tfplan
terraform apply -auto-approve tfplan
