az account set -s $SUBSCRIPTION_NAME
az container create \
    --resource-group $CONTAINER_RESOURCE_GROUP \
    --name "indexer-${IDENTIFIER}-aci-${RANDOM}" \
    --image $IMAGE_URL \
    --ip-address public \
    --ports 8082 \
    --restart-policy $RESTART_POLICY \
    --environment-variables "AZURE_TENANT_ID"="${TENANT_ID}" \
                            "AZURE_CLIENT_ID"="${ENV_PRINCIPAL_ID}" \
                            "AZURE_CLIENT_SECRET"="${ENV_PRINCIPAL_SECRET}" \
                            "KEYVAULT_URI"="${ENV_KEYVAULT}" \
                            "aad_client_id"="${aad_client_id}" \
                            "appinsights_key"="${ENV_APPINSIGHTS_KEY}" \
                            "cosmosdb_account"="${ENV_COSMOSDB_HOST}" \
                            "cosmosdb_database"="${COSMOS_DB_NAME}" \
                            "cosmosdb_key"="${ENV_COSMOSDB_KEY}" \
                            "entitlements_service_endpoint"=$entitlements_service_endpoint \
                            "entitlements_app_key"="${API_KEY}" \
                            "entitlements_service_api_key"="${API_KEY}" \
                            "servicebus_namespace_name"="${ENV_SERVICEBUS_NAMESPACE}" \
                            "servicebus_connection_string"="${ENV_SERVICEBUS_CONNECTION}" \
                            "servicebus_topic_name"="${RECORD_SERVICE_BUS_TOPIC}" \
                            "storage_service_url"="${storage_service_url}" \
                            "STORAGE_SCHEMA_HOST"="${STORAGE_SCHEMA_HOST}" \
                            "STORAGE_QUERY_RECORD_HOST"="${STORAGE_QUERY_RECORD_HOST}" \
                            "STORAGE_QUERY_RECORD_FOR_CONVERSION_HOST"="${STORAGE_QUERY_RECORD_FOR_CONVERSION_HOST}" \
                            "partition_service_endpoint"="${partition_service_endpoint}" \
                            "azure_istioauth_enabled"="${azure_istioauth_enabled}" \
                            "server_port"="${server_port}"