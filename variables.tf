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

variable "location" {
  type        = string
  description = "The location where the resources should be created."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create resources."
}

variable "name" {
  type        = string
  description = "A name from which the name of the resources will be chosen. Note that each resource name can be set individually."
}

variable "network_name" {
  type        = string
  description = "The name of the virtual network."
  default     = ""
}

variable "network_address_space" {
  type        = list(string)
  description = "The virtual network address space CIDRs."
  default     = ["15.0.0.0/8"]
}

variable "subnet_name" {
  type        = string
  description = "The name of the subnet dedicated to AKS cluster."
  default     = ""
}

variable "subnet_address_prefix" {
  type        = string
  description = "The AKS cluster subnet address space CIDR."
  default     = "15.0.0.0/16"
}

variable "route_table_name" {
  type        = string
  description = "The name of the route table of the subnet dedicated to AKS cluster."
  default     = ""
}

variable "tags" {
  type        = map(any)
  description = "Tags to apply to resources. A list of key->value pairs."
  default     = {}
}

variable "private_endpoint_network_policies" {
  type        = string
  description = "Enable or Disable network policies for the private endpoint on the subnet. Possible values are Disabled, Enabled, NetworkSecurityGroupEnabled and RouteTableEnabled. Defaults is set to Enabled to keep previous behavior"
  default     = "Enabled"
}
