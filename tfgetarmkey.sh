#!/bin/bash

az login

vault_name=tfstatekv29513
secret_name=tfstatesecret

export ARM_ACCESS_KEY=$(az keyvault secret show \
  --vault-name $vault_name \
  --name $secret_name \
  --query "value" -o tsv)

echo $ARM_ACCESS_KEY > /tmp/ARM_ACCESS_KEY.txt
