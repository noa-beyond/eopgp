# Cluster Infrastructure

This folder contains the necessary files to deploy and manage the cluster infrastructure for the project. It includes Terraform configurations, Kubernetes deployment, service and StatefulSet YAMLs, and configuration files used by pods.

## Contents

- **Terraform**:  
  Contains scripts to provision the cluster infrastructure (VMs, networking, etc.).
  - `main.tf` – main Terraform configuration  
  - `variables.tf` – input variables  
  - `terraform.tfvars` – example variable values  
  - `terraform.tfstate.example` – example state file  
  - `.terraform.lock.hcl`

- **Deployments**:  
  Kubernetes deployment YAMLs for all services in the cluster.  
  - `gateway.yaml`  
  - `hub_manager.yaml`  
  - `kafka1.yaml`, `kafka2.yaml`  
  - `chdm.yaml`
  - `postgres_pgstac.yaml`
  - `stac.yaml`
  -  `ubuntu_vm.yaml`
  -  `noa_ui.ymal`

- **StatefulSets**:  
  YAMLs for StatefulSet-managed components.  
  - `zookeeper.yaml`

- **Configs**:  
  JSON configuration files used by the pods.  

