# Seldon

**tl; dr;** A [combinator](https://combinator.ml) data component that installs [Seldon-Core](https://www.seldon.io/tech/products/core/), an ML serving framework.

- [Introduction](#introduction)
- [Test Drive](#test-drive)
- [Usage](#usage)

## Introduction

[Seldon-Core](https://www.seldon.io/tech/products/core/) is an open-source model serving and monitoring framework. It allows you to deploy your ML models so that they can be consumed by users over consistent REST APIs. In addition, other Seldon tools allow you to monitor your model in production.

 [Learn more about Seldon-Core in the repo.](https://github.com/SeldonIO/seldon-core)

## Test Drive

The fastest way to get started is to use the test drive functionality provided by [TestFaster](https://testfaster.ci). Click on the "Launch Test Drive" button below (opens a new window).

<a href="https://testfaster.ci/launch?embedded=true&amp;repo=https://github.com/combinator-ml/terraform-k8s-seldon&amp;file=examples/testfaster/.testfaster.yml" target="\_blank">:computer: Launch Test Drive :computer:</a>

### Launch Jupyter

Once the component has launched, click on the Jupyter link. Feast does not have a UI by default. You will use Jupyter to interact with Seldon-Core via its Kubernetes API.

### Example Notebook

Once inside Jupyter, browse to the demo notebook, which comes from the [official quick start guide](https://docs.seldon.io/projects/seldon-core/en/v1.1.0/workflow/quickstart.html). Follow the instructions in the notebook to deploy a pre-trained model.

## Usage

### Prerequisites

Start by preparing your Kubernetes cluster using one of the [infrastructure components](https://combinator.ml/infrastructure/introduction/) or use your own cluster.

### Component Usage

```terraform
module "seldon" {
  source  = "combinator-ml/seldon/k8s"
  # Optional settings go here
}
```

See the full configuration options below.

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
