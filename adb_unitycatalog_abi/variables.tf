variable "subscription_id" {
    description = "Azure subscription id"
    default = "4832a206-d0dd-4491-93a6-c7b77dc99dda"
}

variable "rg_name" {
    description = "Name of the resource group where resources are provisioned"
    type = string
    default = "rg-gavb-workshop-databricks"
}

variable "location" {
    description = "value"
    type = string
    default = "West Europe"
}

variable "databricks_workspace_name" {
    description = "Names of Databricks workspaces to be assigned to metastore"
    type = string
}

variable "metastore_name" {
    description = "Name of the metastore"
    type = string
}
variable "access_connector_name" {
    description = "Name of the access connector used to create storage credentials"
    type = string
}

variable "rawbronze_storage_account" {
    description = "Name of the storage account for the raw and bronze layers"
    type = string
}

variable "silvergold_storage_account" {
    description = "Name of the storage account for the silver and gold layers"
    type = string
}

variable "container_name" {
    description = "Name of the container to be created"
    type = string
    default = "defaultmanaged"
}