# Week 4: Infrastructure Track Input Variables

variable "aws_region" {
  type        = string
  description = "Target deployment region infrastructure execution"
  default     = "us-east-1"
}