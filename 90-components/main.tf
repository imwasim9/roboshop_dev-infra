module "components" {
    for_each = var.components
    source = "git::https://github.com/imwasim9/roboshop-terraform-modules.git?ref=main"
    component = each.key
    rule_priority = each.value.rule_priority
}