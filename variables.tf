#
# Variables Configuration
#

variable "cluster-name" {
  default = "terraform-eks-demo"
  type    = string
}

# Default - Ohio
variable "region" {
  default = "us-east-2"
  type    = string
}