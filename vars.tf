variable "actions" {
  description = "List of actions what should be executed"
  type        = list(string)
}
variable "cluster_id" {
  type = string
}

variable "alarm_prefix" {
  type = string
}

variable "tags" {
  default = {}
}

variable "cpu_utilization_threshold" {
  type    = number
  default = 70
}

variable "cpu_utilization_evaluation_periods" {
  type    = number
  default = 1
}

variable "cpu_utilization_period" {
  type    = number
  default = 60
}
