#! /bin/bash

dev_workspace=$(jq -r .dev.workspace_name ../tfriend.json)
stage_workspace=$(jq -r .dev.workspace_name ../tfriend.json)
prod_workspace=$(jq -r .dev.workspace_name ../tfriend.json)

read -p "pick - (dev/stage/prod)? " answer

if [[ $answer = "dev" ]]; then
  eval "terraform workspace select ${dev_workspace}"
  terraform init
  terraform apply -var-file="./env/dev.tfvars"
elif [[ $answer = "stage" ]]; then
  eval "terraform workspace select ${stage_workspace}"
  terraform init
  terraform apply -var-file="./env/stage.tfvars"
elif [[ $answer = "prod" ]]; then
  eval "terraform workspace select ${prod_workspace}"
  terraform init
  terraform apply -var-file="./env/prod.tfvars"
fi
