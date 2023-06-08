variable "rg_name" {
    description = "value"
    type = string
    default = "rg-gavb-workshop-databricks"
}

variable "location" {
    description = "value"
    type = string
    default = "West Europe"
}

variable "databricks_workspace_name" {
    description = "Name of Databricks workspace"
    type = string
}

variable "metastore_storage_name" {
    description = "Name of the storage account for Unity Catalog metastore"
    type = string
}

variable "access_connector_name" {
    description = "Name of the access connector used to create storage credentials"
    type = string
}