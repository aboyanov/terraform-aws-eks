# create ~/.kube folder if not exist and add the kubeconfig
resource "null_resource" "write-kubeconfig" {
  provisioner "local-exec" {
    command = "mkdir ~/.kube/ | true && terraform output kubeconfig>~/.kube/config"
  }
}

resource "null_resource" "apply-konfigmap" {
  provisioner "local-exec" {
    command = "terraform output config_map_aws_auth > configmap.yml && kubectl apply -f configmap.yml"
  }
}