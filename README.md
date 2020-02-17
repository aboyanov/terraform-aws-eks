# Create EKS cluster with Terraform

Also config.tf will create:
1. ~/.kube/ dir if not exist and will update the kubeconfig in order for the `kubectl` to be able to connect to the cluster.

2. Also will create a ConfigMap. The `ConfigMap` is a Kubernetes configuration, in this case for granting access to our EKS cluster. This ConfigMap allows our ec2 instances in the cluster to communicate with the EKS master, as well as allowing our user account access to run commands against the cluster. 
