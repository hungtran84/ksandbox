# ksandbox
Kubernetes Sandbox project

## 1. Create a service principal

- Get the current subscription

```shell
SUBSCRIPTION_ID=$(az  account show | jq -r .id)
```

- Create RBAC

```shell
export MSYS_NO_PATHCONV=1    
az ad sp create-for-rbac --name tfcloud --role Contributor --scopes /subscriptions/$SUBSCRIPTION_ID
```

## Set up Terraform Cloud

```
export ARM_SUBSCRIPTION_ID="<azure_subscription_id>"
export ARM_TENANT_ID="<azure_subscription_tenant_id>"
export ARM_CLIENT_ID="<service_principal_appid>"
export ARM_CLIENT_SECRET="<service_principal_password>"
```

## Set up Github Action

Your GitHub Action will connect to Terraform Cloud in order to plan and apply your configuration. Before we can configure the Actions workflow, you must generate a user API token and add your Azure credentials to your Terraform Cloud workspace.

- Create User API Token at https://app.terraform.io/app/settings/tokens


