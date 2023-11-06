resource "azurerm_public_ip" "this" {
  name                = "${var.name}-public-ip"
  resource_group_name = var.rg.name
  location            = var.rg.location
  allocation_method   = "Static"
  sku                 = "Standard"
  sku_tier            = "Regional"
  zones               = [1, 2, 3]
  lifecycle {
    ignore_changes = [
      tags.business_unit,
      tags.environment,
      tags.product,
      tags.subscription_type
    ]
  }
}

resource "azurerm_nat_gateway" "this" {
  name                = var.name
  resource_group_name = var.rg.name
  location            = var.rg.location
  lifecycle {
    ignore_changes = [
      tags.business_unit,
      tags.environment,
      tags.product,
      tags.subscription_type
    ]
  }
}

resource "azurerm_nat_gateway_public_ip_association" "this" {
  nat_gateway_id       = azurerm_nat_gateway.this.id
  public_ip_address_id = azurerm_public_ip.this.id
}