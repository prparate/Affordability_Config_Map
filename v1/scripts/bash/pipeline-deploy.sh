#!/bin/bash

# Import functions defined in utils.sh
. ./scripts/bash/utils.sh --source-only

# Loging in Azure.
AzureLogin $AZURE_PRINCIPAL_ID $AZURE_PRINCIPAL_PASSWORD $AZURE_TENANT_NAME $AZURE_SUBSCRIPTION_ID

# Getting credentials.
AzureGetCredentials $AZURE_RESOURCE_GROUP $AZURE_SERVICE_NAME

# Set kubectl context.
kubectl config use-context $KUBE_CONTEXT

make update-env ENV=$ENV

# Logging out of Azure.
AzureLogout