data "aws_elasticache_cluster" "cluster" {
  cluster_id = var.cluster_id
}

resource "aws_cloudwatch_metric_alarm" "cpu_utilization" {
  for_each = data.aws_elasticache_cluster.cluster.cache_nodes

  alarm_name          = "${var.alarm_prefix}: CPU utilization is high for ${var.cluster_id}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.cpu_utilization_evaluation_periods
  threshold           = var.cpu_utilization_threshold
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ElastiCache"
  period              = var.cpu_utilization_period
  statistic           = "Average"
  alarm_description   = "Count of errors are above threshold: ${var.cpu_utilization_threshold}"
  treat_missing_data  = "notBreaching"
  alarm_actions       = var.actions
  tags                = var.tags

  dimensions = {
    CacheClusterId = eeach.value.id
  }
}