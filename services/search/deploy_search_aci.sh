az account set -s $SUBSCRIPTION_NAME
az container create \
    --resource-group $CONTAINER_RESOURCE_GROUP \
    --name "search-${IDENTIFIER}-aci-${RANDOM}" \
    --image $IMAGE_URL \
    --ip-address public \
    --ports 8082 \
    --restart-policy $RESTART_POLICY \
    --environment-variables "AZURE_TENANT_ID"="${TENANT_ID}" \
                            "AZURE_CLIENT_ID"="${ENV_PRINCIPAL_ID}" \
                            "AZURE_CLIENT_SECRET"="${ENV_PRINCIPAL_SECRET}" \
                            "KEYVAULT_URI"="${ENV_KEYVAULT}" \
                            "aad_client_id"="${ENV_APP_ID}" \
                            "appinsights_key"="${ENV_APPINSIGHTS_KEY}" \
                            "APPLICATIONINSIGHTS_CONNECTION_STRING"="${APPLICATIONINSIGHTS_CONNECTION_STRING}" \
                            "cosmosdb_account"="${ENV_COSMOSDB_HOST}" \
                            "cosmosdb_database"="${COSMOS_DB_NAME}" \
                            "cosmosdb_key"="${ENV_COSMOSDB_KEY}" \
                            "azure_activedirectory_AppIdUri"="${azure_activedirectory_AppIdUri}" \
                            "entitlements_service_endpoint"=$entitlements_service_endpoint \
                            "entitlements_service_api_key"="${API_KEY}" \
                            "LOG_PREFIX"="${LOG_PREFIX}" \
                            "ELASTIC_CACHE_EXPIRATION"="${ELASTIC_CACHE_EXPIRATION}" \
                            "MAX_CACHE_VALUE_SIZE"="${MAX_CACHE_VALUE_SIZE}" \
                            "ENVIRONMENT"="${ENVIRONMENT}" \
                            "partition_service_endpoint"="${partition_service_endpoint}" \
                            "azure_istioauth_enabled"="${azure_istioauth_enabled}" \
                            "search_service_spring_logging_level"="${search_service_spring_logging_level}"
                            "search_service_port"="${search_service_port}" \
                            "server_port"="${server_port}"