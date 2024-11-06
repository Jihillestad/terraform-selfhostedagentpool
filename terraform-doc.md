<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 4.8.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.8.0 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.5.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_network_interface.vm_nic](https://registry.terraform.io/providers/hashicorp/azurerm/4.8.0/docs/resources/network_interface) | resource |
| [azurerm_network_security_group.app_network_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/4.8.0/docs/resources/network_security_group) | resource |
| [azurerm_public_ip.app_public_ip](https://registry.terraform.io/providers/hashicorp/azurerm/4.8.0/docs/resources/public_ip) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/4.8.0/docs/resources/resource_group) | resource |
| [azurerm_storage_account.eshoponweb](https://registry.terraform.io/providers/hashicorp/azurerm/4.8.0/docs/resources/storage_account) | resource |
| [azurerm_storage_blob.windows-agent-install](https://registry.terraform.io/providers/hashicorp/azurerm/4.8.0/docs/resources/storage_blob) | resource |
| [azurerm_storage_container.data](https://registry.terraform.io/providers/hashicorp/azurerm/4.8.0/docs/resources/storage_container) | resource |
| [azurerm_subnet.SubnetA](https://registry.terraform.io/providers/hashicorp/azurerm/4.8.0/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.SubnetA_nsg_link](https://registry.terraform.io/providers/hashicorp/azurerm/4.8.0/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_machine_extension.install_devops_agent](https://registry.terraform.io/providers/hashicorp/azurerm/4.8.0/docs/resources/virtual_machine_extension) | resource |
| [azurerm_virtual_network.app_network](https://registry.terraform.io/providers/hashicorp/azurerm/4.8.0/docs/resources/virtual_network) | resource |
| [azurerm_windows_virtual_machine.vm](https://registry.terraform.io/providers/hashicorp/azurerm/4.8.0/docs/resources/windows_virtual_machine) | resource |
| [local_file.windows_agent_script](https://registry.terraform.io/providers/hashicorp/local/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | Admin password for the Virtual Machine. | `string` | n/a | yes |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | Admin username for the Virtual Machine. | `string` | n/a | yes |
| <a name="input_agent-name"></a> [agent-name](#input\_agent-name) | The name of the agent. | `string` | `"self-hosted-agent"` | no |
| <a name="input_agent_version"></a> [agent\_version](#input\_agent\_version) | Agent version (default: latest) | `string` | `""` | no |
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | Azure Client ID | `string` | n/a | yes |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | Azure Client Secret | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of all resources deployed. | `string` | `"norwayeast"` | no |
| <a name="input_pat"></a> [pat](#input\_pat) | The Personal Access Token of the Azure DevOps. | `string` | n/a | yes |
| <a name="input_pool"></a> [pool](#input\_pool) | The Pool name of the Azure DevOps. | `string` | n/a | yes |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | Resource Group name. | `string` | `"app-grp"` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | The Virtual Network Subnet for Virtual Machine name. | `string` | `"subnet-vm"` | no |
| <a name="input_subnet_range"></a> [subnet\_range](#input\_subnet\_range) | The Virtual Network Subnet for Virtual Machine range. | `string` | `"10.0.0.0/26"` | no |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | Azure Subscription ID | `string` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | Azure Tenant ID | `string` | n/a | yes |
| <a name="input_url"></a> [url](#input\_url) | The URL of the Azure DevOps. | `string` | n/a | yes |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | Virtual Machine name. | `string` | `"app-vm"` | no |
| <a name="input_vm_nic_name"></a> [vm\_nic\_name](#input\_vm\_nic\_name) | The Virtual Machine Network interface name. | `string` | `"vm-nic"` | no |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | Virtual Machine size. | `string` | `"Standard_B2s"` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | The Virtual Network name. | `string` | `"vnet"` | no |
| <a name="input_vnet_range"></a> [vnet\_range](#input\_vnet\_range) | The Virtual Network range. | `string` | `"10.0.0.0/24"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->