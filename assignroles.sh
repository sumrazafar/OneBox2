#!/usr/bin/env bash
#
#  Purpose: Initialize the template load for testing purposes
#  Usage:
#    assignroles.sh



###############################
## ARGUMENT INPUT            ##
###############################

usage() { echo "Usage: assignRoles.sh " 1>&2; exit 1; }

if [ -f ./.envrc ]; then source ./.envrc; fi

if [ ! -z $1 ]; then INITIALS=$1; fi
if [ -z $INITIALS ]; then
  INITIALS="ipc"
fi


###############################
## FUNCTIONS                 ##
###############################
function ContainerRole() {
  # Required Argument $1 = RESOURCE_GROUP
  if [ -z $1 ]; then
    tput setaf 1; echo 'ERROR: Argument $1 (RESOURCE_GROUP) not received'; tput sgr0
    exit 1;
  fi

  local _result=$(az acr list --resource-group $1 --query [0].id -otsv)

  if [ "$_result" == "" ]; then
    tput setaf 1; echo 'No Container Registry Found'; tput sgr0
  else
    tput setaf 3; echo 'Giving Reader rights to the Container Registry...' ; tput sgr0
    az role assignment create --assignee $OBJECT_ID --scope $_result --role Reader -ojsonc
  fi
}

###############################
## Azure Intialize           ##
###############################

tput setaf 2; echo 'Assigning Roles...' ; tput sgr0
RESOURCE_GROUP="$INITIALS-common"
ContainerRole $RESOURCE_GROUP
