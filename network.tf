/**
 * Copyright 2020 Quortex
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

# A virtual network for Quortex resources.
resource "azurerm_virtual_network" "quortex" {
  name                = length(var.network_name) > 0 ? var.network_name : var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.network_address_space

  tags = var.tags
}

# A subnet for AKS cluster usage.
resource "azurerm_subnet" "aks" {
  name                              = length(var.subnet_name) > 0 ? var.subnet_name : "${var.name}-aks"
  resource_group_name               = var.resource_group_name
  virtual_network_name              = azurerm_virtual_network.quortex.name
  address_prefixes                  = [var.subnet_address_prefix]
  private_endpoint_network_policies = var.private_endpoint_network_policies
}

# A route table must be configured on the AKS cluster subnet for multiple nodepools usage.
resource "azurerm_route_table" "quortex" {
  name                = length(var.route_table_name) > 0 ? var.route_table_name : "${var.name}-aks"
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags
}

# Associates a Route Table with a Subnet within a Virtual Network.
resource "azurerm_subnet_route_table_association" "quortex" {
  subnet_id      = azurerm_subnet.aks.id
  route_table_id = azurerm_route_table.quortex.id
}
