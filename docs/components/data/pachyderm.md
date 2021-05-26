# Pachyderm

**tl; dr;** A [combinator](https://combinator.ml) data component that installs [Pachyderm](https://www.pachyderm.com), a data lineage and pipelining solution.

- [Introduction](#introduction)
- [Test Drive](#test-drive)
- [Usage](#usage)

## Introduction

[Pachyderm](https://www.pachyderm.com) is an open-source-driven solution that provides data lineage and pipelines. Data lineage is important for \_provenance\_; knowing the origin of downstream assets. In ML, the assets are often models and the provenance describes how the model became to be. Precise knowledge of what a model was trained upon is important for disaster recovery, auditing, and robustness.

Pipelines encode a process. This can be anything from automating pre-processing, to training and deploying models. Pachyderm's solution is unique beacuse it is backed by data lineage; i.e. data driven pipelines, not process driven ones.

## Test Drive

The fastest way to get started is to use the test drive functionality provided by [TestFaster](https://testfaster.ci). Click on the "Launch Test Drive" button below (opens a new window).

<a href="https://testfaster.ci/launch?embedded=true&amp;repo=https://github.com/combinator-ml/terraform-k8s-pachyderm&amp;file=examples/testfaster/.testfaster.yml" target="\_blank">:computer: Launch Test Drive :computer:</a>

### Quick Start Pachyderm Tutorial

Once the test drive has launched, click the two links to the left to get started with Pachyderm:

1. Click the Jupyter link and launch the `demo.ipynb` notebook.  
2. Click on the Dashboard link to launch the Pachyderm Enterprise Dashboard.

## Usage

### Prerequisites

Start by preparing your Kubernetes cluster using one of the [infrastructure components](https://combinator.ml/infrastructure/introduction/) or use your own cluster.

### Component Usage

```terraform
module "pachyderm" {
  source  = "combinator-ml/pachyderm/k8s"
  # Optional settings go here
}
```

See the full configuration options below.

## Requirements

| Name | Version |
|------|---------|
| helm | ~> 2.1.2 |
| kubernetes | ~> 2.2.0 |
| null | ~> 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| helm | ~> 2.1.2 |
| kubernetes | ~> 2.2.0 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [helm_release](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) |
| [kubernetes_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| namespace | (Optional) The namespace to install the release into. | `string` | `"pachyderm"` | no |
| values | (Optional) List of values in raw yaml to pass to helm. See https://github.com/pachyderm/helmchart/blob/master/pachyderm/values.yaml. | `list(string)` | <pre>[<br>  "tls:\n  certName: null # Disable TLS\n  create: null # Disable TLS\npachd:\n  logLevel: debug\n  storage:\n    backend: LOCAL\n"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| namespace | Namespace is the kubernetes namespace of the release. |
