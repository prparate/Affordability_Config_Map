#!/bin/bash

# Log will output the current datetime, the message and its level on the standard output.
# $1: level   <string> Level of the message. (INFO|OK|FAIL)
# $2: message <string> Message to output.
Log() {
    dt=$(date '+%Y-%m-%d %H:%M:%S');
    echo -e [$1] '\t' [$dt] $2
}

# AzureLogin will simply login the Azure service principal.
# $1: id               <string> Azure service principal ID.
# $2: password         <string> Azure service principal password.
# $3: tenant           <string> Tenant name.
# $4: subscription-id  <string> Number of seconds to wait between two attempts.
AzureLogin() {
    Log "INFO" "Logging in Azure service principal..."

    az login --service-principal -u $1 -p $2 --tenant $3

    Log "INFO" "Setting Azure account subscription ..."

    az account set --subscription $4
}

# AzureGetCredentials will fetch the credentials for the Azure service principal.
# $1: resource-group <string> Resource group name.
# $2: service-name   <string> Service name.
AzureGetCredentials() {
    Log "INFO" "Getting Azure service principal credentials..."

    az aks get-credentials --resource-group $1 --name $2 --admin
}

# AzureLogout will simply proceed to log out the Azure service principal account.
AzureLogout() {
    Log "INFO" "Logging out Azure service principal..."

    az logout
}
