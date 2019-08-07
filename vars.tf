variable "actions" {
  description = "List of actions what should be executed"
  type        = list(string)
}
variable "replication_group_id" {
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

variable "cpu_utilization_treat_missing_data" {
  type    = string
  default = "notBreaching"
}


variable "engine_cpu_utilization_threshold" {
  type    = number
  default = 70
}

variable "engine_cpu_utilization_evaluation_periods" {
  type    = number
  default = 1
}

variable "engine_cpu_utilization_period" {
  type    = number
  default = 60
}

variable "engine_cpu_utilization_treat_missing_data" {
  type    = string
  default = "notBreaching"
}


variable "freeable_memory_threshold" {
  type    = number
  default = 1024 * 1024 * 200 # 200 mb
}

variable "freeable_memory_evaluation_periods" {
  type    = number
  default = 1
}

variable "freeable_memory_period" {
  type    = number
  default = 60
}

variable "freeable_memory_treat_missing_data" {
  type    = string
  default = "notBreaching"
}
