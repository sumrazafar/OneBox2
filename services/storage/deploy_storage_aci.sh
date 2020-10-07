az account set -s $SUBSCRIPTION_NAME
az container create \
    --resource-group $CONTAINER_RESOURCE_GROUP \
    --name "storage-${IDENTIFIER}-aci-${RANDOM}" \
    --image $STORAGE_IMAGE_URL \
    --restart-policy $RESTART_POLICY \
    --environment-variables "AZURE_TENANT_ID"="${TENANT_ID}" \
                            "AZURE_CLIENT_ID"="${ENV_PRINCIPAL_ID}" \
                            "AZURE_CLIENT_SECRET"="${ENV_PRINCIPAL_SECRET}" \
                            "KEYVAULT_URI"="${ENV_KEYVAULT}" \
                            "aad_client_id"="${ENV_APP_ID}" \
                            "appinsights_key"="${ENV_APPINSIGHTS_KEY}" \
                            "cosmosdb_account"="${ENV_COSMOSDB_HOST}" \
                            "cosmosdb_database"="${COSMOS_DB_NAME}" \
                            "cosmosdb_key"="${ENV_COSMOSDB_KEY}" \
                            "entitlements_app_key"="${API_KEY}" \
                            "entitlements_service_api_key"="${API_KEY}" \
                            "entitlements_service_endpoint"=$entitlements_service_endpoint \
                            "legal_service_endpoint"=$legal_service_endpoint \
                            "legal_service_region"=$legal_service_region \
                            "search_service_endpoint"=$search_service_endpoint \
                            "servicebus_namespace_name"="${ENV_SERVICEBUS_NAMESPACE}" \
                            "servicebus_connection_string"="${ENV_SERVICEBUS_CONNECTION}" \
                            "servicebus_topic_name"="${RECORD_SERVICE_BUS_TOPIC}" \
                            "storage_account"="${ENV_STORAGE}" \
                            "storage_account_key"="${ENV_STORAGE_KEY}" \
                            "server_port"=$server_port
                            