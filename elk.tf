resource "aws_security_group" "es_sg" {
  name = "${var.es_domain}-sg"
  description = "Allow inbound traffic to ElasticSearch from VPC CIDR"
  vpc_id = aws_vpc.demo.id

  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      aws_vpc.demo.cidr_block
    ]
  }

  egress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# You need a service-linked-role:
# https://github.com/terraform-providers/terraform-provider-aws/issues/5218
resource "aws_iam_service_linked_role" "default" {
  aws_service_name = "es.amazonaws.com"
  description      = "AWSServiceRoleForAmazonElasticsearchService Service-Linked Role"
}

resource "aws_elasticsearch_domain" "es" {
  domain_name           = var.es_domain
  elasticsearch_version = var.elasticsearch_version

  encrypt_at_rest {
    enabled    = var.encryption_enabled
    kms_key_id = var.encryption_kms_key_id
  }

  cluster_config {
    instance_type            = var.itype
    instance_count           = var.icount
    dedicated_master_enabled = var.dedicated_master
    dedicated_master_type    = var.mtype
    dedicated_master_count   = var.mcount
    zone_awareness_enabled   = var.zone_awareness
  }

  access_policies = var.access_policies

  vpc_options {
    security_group_ids = [aws_security_group.es_sg.id]
    subnet_ids         = var.es_subnets
  }

  advanced_options = {
    "rest.action.multi.allow_explicit_index" = var.rest_action_multi_allow_explicit_index
    "indices.fielddata.cache.size"           = var.indices_fielddata_cache_size
    "indices.query.bool.max_clause_count"    = var.indices_query_bool_max_clause_count
  }

  ebs_options {
    ebs_enabled = true
    volume_type = var.volume_type
    volume_size = var.volume_size
  }

  snapshot_options {
    automated_snapshot_start_hour = var.snapshot_start
  }

  tags = {
    Domain = var.es_domain
  }

  depends_on = [
    aws_iam_service_linked_role.default,
  ]
}

# Add ALB record on DNS
//resource "aws_route53_record" "main" {
//  count = length(var.zone_id) > 0 ? 1 : 0
//  zone_id = var.zone_id
//  name    = var.name
//  type    = "CNAME"
//  ttl     = "300"
//
//  records = [aws_elasticsearch_domain.es.endpoint]
//}