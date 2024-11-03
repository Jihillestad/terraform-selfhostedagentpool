# Custom script extension to install the DevOps agent
resource "azurerm_virtual_machine_extension" "azuredevopsvmex" {
  name                 = "AzureDevopsAgent"
  virtual_machine_id   = azurerm_windows_virtual_machine.vm.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"

  settings = <<SETTINGS
  {
  "fileUris": ["https://maxmelcherdevops.blob.core.windows.net/terraform/devops_win.ps1?sp=r&st=2019-03-13T11:13:24Z&se=2022-03-13T19:13:24Z&spr=https&sv=2018-03-28&sig=%2BlOz%2Fza3vlunvhARYgG5GLlrhzRADE1LrLUWu9cIlUc%3D&sr=b"],
  "commandToExecute": "powershell.exe -ExecutionPolicy Unrestricted -File ./devops_win.ps1 -URL ${var.url} -PAT ${var.pat} -POOL ${var.pool} -AGENT ${var.agent-name}",
  "timestamp" : "12"
  }
SETTINGS

}
