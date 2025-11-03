terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "1.54.1"
    }
  }
}

provider "openstack" {
  auth_url    = var.os_auth_url
  tenant_name = var.os_project_name
  user_name    = var.os_username
  password    = var.os_password
  region      = var.os_region_name
}

resource "openstack_containerinfra_cluster_v1" "my_cluster" {
  name = "NoaK8s"
}

output "cluster_id" {
  value = openstack_containerinfra_cluster_v1.my_cluster.id
}

