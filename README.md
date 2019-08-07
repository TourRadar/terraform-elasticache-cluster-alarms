# terraform-elasticache-cluster-alarms
Terraform module to automate creating elasticache redis cluster alarms

## Example usage
```terraform
module "terraform-elasticache-cluster-alarms" {
  source = "github.com/TourRadar/terraform-elasticache-cluster-alarms"
  cluster_id = "some cluster id"
  actions      = ["snsarn etc"]
  alarm_prefix = "MyAlarmPrefix"
  tags = {
    Project = "SomeProject"
  }
}
```
