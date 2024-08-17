resource "aws_backup_plan" "backup_plan" {
  name = "project"

  rule {
    rule_name         = "project"
    target_vault_name = aws_backup_vault.default.name
    schedule          = "cron(0 5 * * ? *)"

    lifecycle {
      delete_after = var.deletion_time
    }
    enable_continuous_backup = true
  }
}

resource "aws_backup_selection" "backup_selection" {
  iam_role_arn = aws_iam_role.aws_backup_service_role.arn
  name         = "backup_resources"
  plan_id      = aws_backup_plan.backup_plan.id
  selection_tag {
    type  = "STRINGEQUALS"
    key   = var.backup_key
    value = var.backup_value
  }
}
