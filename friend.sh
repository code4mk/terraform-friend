#! /bin/bash

read -p "pick - (validate/ready/plan/apply/destroy)? " answer

if [[ $answer = "validate" ]]; then
  eval "./cli/validate.sh"
elif [[ $answer = "ready" ]]; then
  eval "./cli/ready.sh"
elif [[ $answer = "plan" ]]; then
  eval "./cli/plan.sh"
elif [[ $answer = "apply" ]]; then
  eval "./cli/apply.sh"
elif [[ $answer = "destroy" ]]; then
  eval "./cli/destroy.sh"
fi