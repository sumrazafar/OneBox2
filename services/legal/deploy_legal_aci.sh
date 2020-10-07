az account set -s $SUBSCRIPTION_NAME
az container create \
    --resource-group $CONTAINER_RESOURCE_GROUP \
    --name "legal-${IDENTIFIER}-aci-${RANDOM}" \
    --image $IMAGE_URL \
    --ip-address public \
    --ports 8082 \
    --restart-policy $RESTART_POLICY \
    --output table \
    --environment-variables "AZURE_TENANT_ID"="${TENANT_ID}" \
                            "AZURE_CLIENT_ID"="${ENV_PRINCIPAL_ID}" \
                            "AZURE_CLIENT_SECRET"="${ENV_PRINCIPAL_SECRET}" \
                            "azure_activedirectory_session_stateless"="${azure_activedirectory_session_stateless}" \
                            "azure_activedirectory_AppIdUri"="${azure_activedirectory_AppIdUri}" \
                            "aad_client_id"="${ENV_APP_ID}" \
                            "appinsights_key"="${ENV_APPINSIGHTS_KEY}" \
                            "KEYVAULT_URI"="${ENV_KEYVAULT}" \
                            "cosmosdb_database"="${COSMOS_DB_NAME}" \
                            "storage_account"="${storage_account}" \
                            "azure_storage_container_name"="${azure_storage_container_name}" \
                            "azure_storage_enable_https"="${azure_storage_enable_https}" \
                            "servicebus_topic_name"="${servicebus_topic_name}" \
                            "servicebus_namespace_name"="${servicebus_namespace_name}" \
                            "entitlements_service_endpoint"="${entitlements_service_endpoint}" \
                            "entitlements_service_api_key"="${entitlements_service_api_key}" \
                            "LOG_PREFIX"="${LOG_PREFIX}" \
                            "legal_service_region"="${legal_service_region}" \
                            "partition_service_endpoint"="${partition_service_endpoint}" \
                            "azure_istioauth_enabled"="${azure_istioauth_enabled}" \
                            "server_port"="${server_port}"