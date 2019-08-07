# terraform-elasticache-cluster-alarms
Terraform module to automate creating elasticache redis cluster alarms

## Example usage
```terraform
module "terraform-elasticache-cluster-alarms" {
  source = "github.com/TourRadar/terraform-elasticache-cluster-alarms"
  replication_group_id = aws_elasticache_replication_group.example.replication_group_id
  actions      = ["snsarn etc"]
  alarm_prefix = "MyAlarmPrefix"
  tags = {
    Project = "SomeProject"
  }
}
```
