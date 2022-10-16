
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  /* Below Authentication method will not be used directly. We will authenticate to Azure either via
  jenkins azure credentials plugin by adding below information and validating service principle OR
  by using azure key vault plugin and calling key vault values in environment section of Jenkins File
  
  If we plan to use azure devops yaml pipelines we can create a service connection to azure and use 
  service principal to authenticate. Then we can authorize it initially to run all pipelines
  */
  subscription_id  = "48e8e449-d963-4fe3-a7ca-e4add0d13d83"
  client_id = "d7af60c6-c140-4c3b-b2e0-1f54ab22df48"
  client_secret = "gUj8Q~W6SLbdL1Mf7~1H-zU6q.w6ynVtN85xIcPH" #just adding random value for reference
  tenant_id     = "210eed5c-3cea-48d0-be5d-b882e73db4d1"
}

terraform {
  backend "azurerm" {
    resource_group_name  = "rg-remote-state-tf"
    storage_account_name = "azuredevopsremotestate"
    container_name       = "azuredevopsremotestate"
    key                  = "LtPpT1KRtv7wGfCBGOhe63a2quymXXTNk5N9paaKC+5My81sBdXmecNNTmgtipwNImLMaDRFzwOQ+AStV2pthg=="
  }
}
