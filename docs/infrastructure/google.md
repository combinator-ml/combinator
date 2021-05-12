# Google

Google offer Kubernetes clusters in their [Google Kubernetes Engine](https://cloud.google.com/kubernetes-engine). This component creates a cluster in GKE.

- [Component Website](https://github.com/combinator-ml/terraform-google-kubernetes)

## Prerequisites

To use this component you will need a GCP account, be authorised to create infrastructure and a GCP project id.

## Costs

This runs in a single zone, which means it falls under GCP's free management tier and you don't have to pay for management nodes, only worker nodes. After the first zone you pay, and that's when it gets expensive. See the [GCP pricing pages](https://cloud.google.com/kubernetes-engine/pricing#cluster_management_fee_and_free_tier) for more information.

## Usage

```terraform
module "terraform-google-kubernetes" {
  source  = "combinator-ml/kubernetes/google"
  gcp_project_id = "your-gpc-project-id"
}
```
