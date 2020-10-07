az account set -s $SUBSCRIPTION_NAME
az container create \
    --resource-group $CONTAINER_RESOURCE_GROUP \
    --name "entitlements-${IDENTIFIER}-aci-${RANDOM}" \
    --image $IMAGE_URL \
    --ip-address public \
    --ports 8082 \
    --restart-policy $RESTART_POLICY \
    --environment-variables "AZURE_TENANT_ID"="${TENANT_ID}" \
                            "AZURE_CLIENT_ID"="${ENV_PRINCIPAL_ID}" \
                            "AZURE_CLIENT_SECRET"="${ENV_PRINCIPAL_SECRET}" \
                            "azure_activedirectory_session_stateless"="${azure_activedirectory_session_stateless}" \
                            "azure_activedirectory_AppIdUri"="${azure_activedirectory_AppIdUri}" \
                            "aad_client_id"="${ENV_APP_ID}" \
                            "appinsights_key"="${ENV_APPINSIGHTS_KEY}" \
                            "KEYVAULT_URI"="${ENV_KEYVAULT}" \
                            "cosmosdb_database"="${COSMOS_DB_NAME}" \
                            "spring_application_name"="${spring_application_name}" \
                            "service_domain_name"="${service_domain_name}" \
                            "entitlements_app_key"="${entitlements_app_key}" \
                            "partition_service_endpoint"="${partition_service_endpoint}" \
                            "azure_istioauth_enabled"="${azure_istioauth_enabled}" \
                            "server_port"="${server_port}"