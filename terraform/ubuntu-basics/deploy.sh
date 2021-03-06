#!/bin/bash

#copy decoded terraform.tfvars.asc file in the secrets directory into current directory
cp ~/secrets/terraform.tfvars.asc .

#use gpg to decrypt terraform.tfvars.asc and copy decrypted contents into terraform.tfvars (creates file)
gpg --decrypt --nosymkey-cache --output ./terraform.tfvars ./terraform.tfvars.asc

#verification step of code -- ensure code will deploy
terraform plan

#execute(deploys) terraform
terraform apply

#sleep command pauses execution -- delay next execution for 60 seconds
sleep 60s

#remove decrypted terraform.tfvars (contains sensetive data)
rm ./terraform.tfvars*
