# PowerShell Script to Install Azure DevOps Agent
data "local_file" "windows_agent_script" {
  filename = "windows-agent-install.ps1"
}

resource "azurerm_virtual_machine_extension" "install_devops_agent" {
  name                 = "install-devops-agent"
  virtual_machine_id   = azurerm_windows_virtual_machine.vm.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"
  depends_on           = [azurerm_storage_blob.windows-agent-install]

  # Pass the necessary parameters to the PowerShell script

  settings = <<SETTINGS
  {
      "fileUris": ["https://${azurerm_storage_account.eshoponweb.name}.blob.core.windows.net/data/windows-agent-install.ps1"],
      "commandToExecute": "powershell.exe -ExecutionPolicy Unrestricted -File ./windows-agent-install.ps1 -URL ${var.url} -PAT ${var.pat} -POOL ${var.pool} -AGENT ${var.agent-name}",
      "timestamp" : "12"
  }
  SETTINGS
}
