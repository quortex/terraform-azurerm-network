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

output "subscription_id" {
  value       = var.subscription_id
  description = "The Subscription ID used."
}

output "location" {
  value       = var.location
  description = "The location where resources have been created."
}

output "resource_group_name" {
  value       = var.resource_group_name
  description = "The name of the resource group where resources have been created."
}

output "virtual_network_name" {
  value       = azurerm_virtual_network.quortex.name
  description = "The virtual network name."
}

output "cluster_subnet_id" {
  value       = azurerm_subnet.aks.id
  description = "The AKS cluster dedicated subnet identifier."
}
