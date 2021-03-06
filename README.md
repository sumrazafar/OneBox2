# OneBox2

This deploys infrastructure for an OSDU on Azure using Docker Desktop proof of concept.

- Common Resources
- Data Resources

## Infrastructure Architecture

_architecture diagram goes here_


Single Region Deployment:  All resources deployed using a single region.

[![Deploy To Azure](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fsumrazafar%2FOneBox2%2Fmaster%2Fazuredeploy.json)

[![Visualize](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/visualizebutton.svg?sanitize=true)](http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fsumrazafar%2FOneBox2%2Fmaster%2Fazuredeploy.json)


### Manual Installation

__Setup Environment Variables__

Export environment variables required to use the install script.

>A great tool to do this automatically with is [direnv](https://direnv.net/).

```bash
export AZURE_SUBSCRIPTION="YOUR_SUBSCRIPTION_ID"
export AZURE_LOCATION="YOUR_REGION"
```

__Execute the Install__

```bash
install.sh
```
