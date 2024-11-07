# Dockerizing Azure CLI

## Introduction

This document describes what I figured out in dockerizing Azure CLI.
Dockerizing Azure CLI is useful when you want to run Azure CLI commands in a
containerized environment. This document provides a step-by-step guide to
dockerize Azure CLI.

## Why Dockerize Azure CLI?

Azure CLI depends on older versions of Python and other dependencies. I want to
avoid messing up my local environment with these dependencies. Dockerizing
Azure CLI is a good way to avoid this problem.

## The example scenario

If multiple team members are working with Terraform against the same Azure resources, they
will run into problems if all of them have their **tfstate** files in their local
machines. We are storing the **tfstate** files in Azure Storage Containers in this scenario.

For Terraform to access the Azure Storage Container, it needs the ARM ACCESS
KEY. We are storing the ARM ACCESS KEY in Azure Key Vault. We need Azure CLI to
get the ARM ACCESS KEY from Azure Key Vault.

How do we get this Environment Variable in the Docker container, and then use
it on the host machine?

## Prerequisites

- Docker
- Terraform

## Step-by-Step Guide

### Step 1: Prepare a shell script for Azure CLI commands

This example is going to grab the Azure Storage Container ARM ACCESS KEY from
Azure Key Vault and store it in an environment variable. Environment variables
are not accessible from outside the container. We need to store the ARM ACCESS
KEY in a file.

Create a shell script named `tfgetarmhey.sh` with the following content:

```bash
#!/bin/bash

az login

vault_name=YOUR_VAULT_NAME
secret_name=YOUR_SECRET

export ARM_ACCESS_KEY=$(az keyvault secret show \
  --vault-name $vault_name \
  --name $secret_name \
  --query "value" -o tsv)

echo $ARM_ACCESS_KEY > /tmp/ARM_ACCESS_KEY.txt
```

### Step 2: Create a Dockerfile

I find long commands hard to read and maintain. I prefer to create a Dockerfile to build the image.

Create a Dockerfile with the following content:

```Dockerfile
FROM mcr.microsoft.com/azure-cli:latest

WORKDIR /app

COPY ./tfgetarmkey.sh /app/tfgetarmkey.sh

RUN chmod +x /app/tfgetarmkey.sh
```

### Step 3: Build the Docker image

Run the following command to build the Docker image:

```bash
docker build -t azure-cli .
```

### Step 4: Run **bash** in the Docker container

1. Run the following commands to run the Docker container:

```bash
docker run -itd --name azure-cli azure-cli
docker exec -it azure-cli bash
```

2. Authenticate using your Browser with the provided code and then use your
   credentials. Press Enter to continue until the shell is available.

### Step 5: Run the shell script in the Docker container:

1. Run the following command to run the shell script in the Docker container:

```bash
./tfgetarmkey.sh
```

2. Type `exit` to exit the Docker container.

### Step 6: Set the environment variable in the host machine

Run the following command to set the environment variable in the host machine:

```bash
export ARM_ACCESS_KEY=$(docker exec azure-cli sh -c 'cat /tmp/ARM_ACCESS_KEY.txt')
```

3. Clean up the Docker container: `docker rm -f azure-cli`

4. Run `terraform init` to initialize Terraform with the ARM ACCESS KEY.
