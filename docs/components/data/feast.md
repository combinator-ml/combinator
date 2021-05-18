# terraform-k8s-feast

Feast terraform module for combinator.ml

## Usage

```terraform
module "feast" {
  source  = "combinator-ml/feast/k8s"
}
```

See the full configuration options below.

### Stack Creation

```bash
KUBE_CONFIG_PATH=~/.kube/config terraform apply
```

### Stack Deletion

```bash
KUBE_CONFIG_PATH=~/.kube/config terraform destroy
```

## Known Issues

- Why do you have to explicitly export the Kubernetes config?

I found that hardcoding the kubeconfig led to [this terraform bug](https://github.com/terraform-aws-modules/terraform-aws-eks/issues/1234).

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| helm | n/a |
| kubernetes | n/a |
| random | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [helm_release](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) |
| [kubernetes_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) |
| [kubernetes_secret](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) |
| [random_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name\_prefix | Prefix to be used when naming the different components of Feast | `string` | `"combinator"` | no |
| namespace | (Optional) The namespace to install into. Defaults to feast. | `string` | `"feast"` | no |

## Outputs

No output.
