az account set -s $SUBSCRIPTION_NAME
az container create \
    --resource-group $CONTAINER_RESOURCE_GROUP \
    --name "partition-${IDENTIFIER}-aci-${RANDOM}" \
    --image $IMAGE_URL \
    --ip-address public \
    --ports 8082 \
    --restart-policy $RESTART_POLICY \
    --output table \
    --environment-variables "AZURE_TENANT_ID"="${TENANT_ID}" \
                            "DEFAULT_PARTITION"="${DEFAULT_PARTITION}" \
                            "AZURE_CLIENT_ID"="${ENV_PRINCIPAL_ID}" \
                            "AZURE_CLIENT_SECRET"="${ENV_PRINCIPAL_SECRET}" \
                            "KEYVAULT_URI"="${ENV_KEYVAULT}" \
                            "appinsights_key"="${ENV_APPINSIGHTS_KEY}" \
                            "aad_client_id"="${ENV_APP_ID}" \
                            "azure_activedirectory_AppIdUri"="${azure_activedirectory_AppIdUri}" \
                            "azure_activedirectory_session_stateless"="${azure_activedirectory_session_stateless}" \
                            "spring_application_name"="${spring_application_name}" \
                            "server_port"="${server_port}"