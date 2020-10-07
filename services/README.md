# Deploying Services into ACI
This guide describes how to take an image of a service and deploy it into ACI. This is just a POC right now. At the moment, this is equivalent to running the service locally, except it is doing so in ACI.
## What You Need
Deploying services into ACI just requires the following:
1. A resource group into which the container will be deployed.
2. .envrc file for the environment to which you want to connect the service.
## Instructions
How to deploy a service:
1. Navigate to the subdirectory for your service.
1. Create a .envrc file.
1. Paste the following at the top of the file:
```bash
export CONTAINER_RESOURCE_GROUP="<your resource group here>"
export IDENTIFIER="<your identifier here (e.g. jasonsan)>"
export IMAGE_URL="<your image here (will ask you for login credentials if registry is not public)>"
export SUBSCRIPTION_NAME="<your subscription here>"
export RESTART_POLICY="OnFailure"
export API_KEY="OBSOLETE"
``` 
1. Paste the .envrc file for the service directly below what you just entered into your .envrc file.
1. Run the deployment script.
1. Take the IP address and port. That is where your service is now running. You can verify by going to `<ip address here>:8082/api/<service>/v2/swagger-ui.html`