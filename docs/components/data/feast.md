# terraform-k8s-seldon

Seldon terraform module for combinator.ml

## Usage

```terraform
module "seldon" {
  source  = "combinator-ml/seldon/k8s"
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

| Name | Version |
|------|---------|
| helm | >= 2.0.0 |
| kubectl | >= 1.7.0 |
| kubernetes | >= 2.0.0 |

## Providers

| Name | Version |
|------|---------|
| helm | >= 2.0.0 |
| kubectl | >= 1.7.0 |
| kubernetes | >= 2.0.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| istio | combinator-ml/istio/k8s | 0.0.1 |

## Resources

| Name |
|------|
| [helm_release](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) |
| [kubectl_file_documents](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/data-sources/file_documents) |
| [kubectl_manifest](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) |
| [kubernetes_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| enable\_example\_seldon\_deployment | Enable an example seldon deployment | `bool` | `true` | no |
| enable\_seldon\_gateway | Create an istio gateway for seldon | `bool` | `true` | no |
| seldon\_core\_operator\_namespace | (Optional) The namespace to install the minio operator into. Defaults to minio-operator | `string` | `"seldon-system"` | no |
| seldon\_core\_values | (Optional) List of values in raw yaml to pass to helm. | `list(string)` | `[]` | no |

## Outputs

No output.
