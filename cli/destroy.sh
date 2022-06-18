#! /bin/bash

#terraform destroy -target=module.k8s-cassandra
read -p "pick - (dev/stage/prod)? " answer

if [[ $answer = "dev" ]]; then
  eval "terraform workspace select infrastructure"
  terraform destroy -var-file="./env/dev.tfvars"
elif [[ $answer = "stage" ]]; then
  eval "terraform workspace select infra-stage"
  terraform destroy -var-file="./env/stage.tfvars"
elif [[ $answer = "prod" ]]; then
  eval "terraform workspace select infra-prod"
  terraform destroy -var-file="./env/prod.tfvars"
fi



# # assign prompt module lists
# declare -a promptModules=("test_security_group", "mk")

# # prompt module length
# promptModuleLength=${#promptModules[@]}
# #theDestroyPrompts = "terraform destroy -auto-approve"
# foo="terraform destroy -auto-approve"
# # use for loop to read all values and indexes
# for (( i=0; i<${promptModuleLength}; i++ ));
# do
#   read -p "Want to destroy module - ${promptModules[$i]}  (y/n)? " answer
#   case ${answer:0:1} in
#       y|Y )
#         foo+=" -target=module.${promptModules[$i]} "
#       ;;
#       * )
#           #echo No
#       ;;
#   esac
# done

