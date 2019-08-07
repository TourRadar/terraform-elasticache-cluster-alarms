data "aws_elasticache_replication_group" "cluster" {
  replication_group_id = var.replication_group_id
}

resource "aws_cloudwatch_metric_alarm" "cpu_utilization" {
  for_each            = data.aws_elasticache_replication_group.cluster.member_clusters
  alarm_name          = "${var.alarm_prefix}: CPU utilization is high for ${var.replication_group_id}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.cpu_utilization_evaluation_periods
  threshold           = var.cpu_utilization_threshold
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ElastiCache"
  period              = var.cpu_utilization_period
  statistic           = "Average"
  alarm_description   = "CPU utilization is higher than: ${var.cpu_utilization_threshold}%"
  treat_missing_data  = var.cpu_utilization_treat_missing_data
  alarm_actions       = var.actions
  tags                = var.tags

  dimensions = {
    CacheClusterId = each.value
  }
}

resource "aws_cloudwatch_metric_alarm" "engine_cpu_utilization" {
  for_each            = data.aws_elasticache_replication_group.cluster.member_clusters
  alarm_name          = "${var.alarm_prefix}: Engine CPU utilization is high for ${each.value}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.engine_cpu_utilization_evaluation_periods
  threshold           = var.engine_cpu_utilization_threshold
  metric_name         = "EngineCPUUtilization"
  namespace           = "AWS/ElastiCache"
  period              = var.engine_cpu_utilization_period
  statistic           = "Average"
  alarm_description   = "CPU utilization is higher than: ${var.engine_cpu_utilization_threshold}%"
  treat_missing_data  = var.engine_cpu_utilization_treat_missing_data
  alarm_actions       = var.actions
  tags                = var.tags

  dimensions = {
    CacheClusterId = each.value
  }
}

resource "aws_cloudwatch_metric_alarm" "freeable_memory" {
  for_each            = data.aws_elasticache_replication_group.cluster.member_clusters
  alarm_name          = "${var.alarm_prefix}: FreeableMemory is too low for ${each.value}"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = var.freeable_memory_evaluation_periods
  threshold           = var.freeable_memory_threshold
  metric_name         = "FreeableMemory"
  namespace           = "AWS/ElastiCache"
  period              = var.freeable_memory_period
  statistic           = "Average"
  alarm_description   = "FreeableMemory is too low, should be greater than ${var.freeable_memory_threshold}"
  treat_missing_data  = var.freeable_memory_treat_missing_data
  alarm_actions       = var.actions
  tags                = var.tags

  dimensions = {
    CacheClusterId = each.value
  }
}