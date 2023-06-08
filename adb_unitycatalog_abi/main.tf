terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
        }

        databricks = {
            source = "databricks/databricks"
        }
    }
}

# Provisioning of Azure resources
provider "azurerm" {
    features {}
}

## Creating the default managed container

### Referencing the existing storage account resources
data "azurerm_storage_account" "storage_accounts" {
    name_starts_with = "brewdatgb"
    resource_group_name = var.rg_name
}

### Creating the container inside the storage account
resource "azurerm_storage_container" "container" {
    name = var.container_name
    storage_account_name = var.silvergold_storage_account
    container_access_type = "private"
}

## Creating Access Connector for Azure Databricks and giving it the necessary permissions

### Creating the access connector
resource "azurerm_databricks_access_connector" "access_connector" {
    name = var.access_connector_name
    resource_group_name = var.rg_name
    location = var.location

    identity {
        type = "SystemAssigned"
    }
}

### Assigning permissions to storage accounts
resource "azurerm_role_assignment" "mi_data_contributr" {
    for_each = data.azurerm_storage_account.storage_accounts
    scope = each.value.id
    role_definition_name = "Storage Blob Data Contributor"
    principal_id = azurerm_databricks_access_connector.access_connector.identity[0].principal_id
}