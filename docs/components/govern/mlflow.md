# terraform-k8s-mlflow

**tl; dr;** A [combinator](https://combinator.ml) governance component that provides a hosted [MLFlow](https://mlflow.org) server, a model repository and experiment tracker.

- [Introduction](#introduction)
- [Test Drive](#test-drive)
- [Usage](#usage)

## Introduction

[MLFlow](https://mlflow.org) is an open-source model registry and experiment tracker. Data scientists leverage this hosted service to store the results of their experiments and persist final artifacts like model parameters and weights.

This provides a centralised catalogue of models and experiments, which is useful for organizational purposes and sharing work.

MLFlow also comes with limited serving capabilities, although that is not it's core aim.

## Test Drive

The fastest way to get started is to use the test drive functionality provided by [TestFaster](https://testfaster.ci). Click on the "Launch Test Drive" button below (opens a new window).

<a href="https://testfaster.ci/launch?embedded=true&amp;repo=https://github.com/combinator-ml/terraform-k8s-mlflow&amp;file=examples/testfaster/.testfaster.yml" target="\_blank">:computer: Launch Test Drive :computer:</a>

## Usage

### Prerequisites

Start by preparing your Kubernetes cluster using one of the [infrastructure components](https://combinator.ml/infrastructure/introduction/) or use your own cluster.

### Component Usage

```terraform
module "mlflow" {
  source  = "combinator-ml/mlflow/k8s"
  # Optional settings go here
}
```

See the full configuration options below.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.14 |
| helm | >= 2.0.0 |
| kubernetes | >= 2.0.0 |

## Providers

| Name | Version |
|------|---------|
| helm | >= 2.0.0 |
| kubernetes | >= 2.0.0 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [helm_release](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) |
| [kubernetes_secret](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name\_prefix | Prefix to be used when naming the different components. | `string` | `"combinator"` | no |
| namespace | The namespace to install into. | `string` | `"mlflow"` | no |

## Outputs

No output.
