#
# Variables Configuration
#

variable "cluster-name" {
  default = "terraform-eks-demo"
  type    = string
}

# Default - Ohio
variable "region" {
  description = "AWS region to use"
  default     = "us-east-2"
  type        = string
}

variable "es_domain" {
  description = "ElasticSearch domain name"
  type        = string
  default     = "lynx-elk-demo"
}

variable "es_subnets" {
  type = list(string)
  description = "List of VPC Subnet IDs to create ElasticSearch Endpoints in"
  default = ["subnet-08fe300b35b3aeaf8"]
}

variable "elasticsearch_version" {
  default     = "5.5"
  description = "Elastic Search Service cluster version number."
  type        = string
}

variable "encryption_enabled" {
  default     = "false"
  description = "Enable encription in Elastic Search."
  type        = string
}

variable "encryption_kms_key_id" {
  default     = ""
  description = "Enable encription in Elastic Search."
  type        = string
}

variable "icount" {
  default     = 2
  description = "Elastic Search Service cluster Ec2 instance number."
  type        = string
}

variable "itype" {
  default     = "m4.large.elasticsearch"
  description = "Elastic Search Service cluster Ec2 instance type."
  type        = string
}

variable "mcount" {
  default     = 0
  description = "Elastic Search Service cluster dedicated master Ec2 instance number."
  type        = string
}

variable "mtype" {
  default     = ""
  description = "Elastic Search Service cluster dedicated master Ec2 instance type."
  type        = string
}

variable "zone_awareness" {
  default     = false
  description = "Indicates whether zone awareness is enabled."
  type        = string
}

variable "dedicated_master" {
  default     = false
  description = "Indicates whether our cluster have dedicated master nodes enabled."
  type        = string
}

variable "access_policies" {
  default     = ""
  description = "IAM policy document specifying the access policies for the domain."
  type        = string
}

variable "rest_action_multi_allow_explicit_index" {
  default     = "true"
  description = "Specifies whether explicit references to indices are allowed inside the body of HTTP requests."
  type        = string
}

variable "indices_query_bool_max_clause_count" {
  default     = 1024
  description = "Maximum number of clauses allowed in a Lucene boolean query."
  type        = string
}

variable "indices_fielddata_cache_size" {
  default     = ""
  description = "Percentage of Java heap space allocated to field data."
  type        = string
}

variable "volume_size" {
  default     = "100"
  description = "Default size of the EBS volumes."
  type        = string
}

variable "volume_type" {
  default     = "gp2"
  description = "Default type of the EBS volumes."
  type        = string
}

variable "snapshot_start" {
  default     = 0
  description = "Elastic Search Service maintenance/snapshot start time."
  type        = string
}