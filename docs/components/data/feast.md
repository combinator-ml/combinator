# Feast

**tl; dr;** A [combinator](https://combinator.ml) data component that installs [Feast](https://feast.dev), a feature store.

- [Introduction](#introduction)
- [Quick Drive](#quick-drive)
  * [Launch Jupyter](#launch-jupyter)
  * [Example Notebook](#example-notebook)
- [Usage](#usage)
  * [Prerequisites](#prerequisites)
  * [Component Usage](#component-usage)

## Introduction

[Feast](https://feast.dev) is an open-source feature store. A feature store allows you to manage, govern, and trace features derived from raw data. This is useful because it helps to unify and standardise, which reduces waste, improves quality, and makes models more reproducible.

Feast does not perform any computation. You can think of it as a meta-database; a database that manages other databases. It effectively creates a cache of feature data, keyed by time. The Feast libraries and CLIs provide a consistent way of pushing or streaming new data into the cache. Downstream systems use a similar interface to access point-in-time data. [Learn more about feast in the documentation.](https://docs.feast.dev)

## Test Drive

The fastest way to get started is to use the test drive functionality provided by [TestFaster](https://testfaster.ci). [Combinator](https://combinator.ml) website users can use the iframe directly. Github users can click on the "Launch Test Drive" button below.

<iframe width="600" height="400" id="testdrive" style="display: block;" src="https://testfaster.ci/launch?embedded=true&amp;repo=https://github.com/combinator-ml/terraform-k8s-feast&amp;file=examples/testfaster/.testfaster.yml"></iframe><br/><br/>

[:computer: Launch Test Drive :computer:](https://testfaster.ci/launch?embedded=true&amp;repo=https://github.com/combinator-ml/terraform-k8s-feast&amp;file=examples/testfaster/.testfaster.yml)

### Launch Jupyter

Once the component has launched, click on the Jupyter link. Feast does not have a UI by default. You will use Jupyter to interact with Feast via its API.

### Example Notebook

Once inside Jupyter, browse to the minimal notebook, which is the [official example](https://github.com/feast-dev/feast/tree/v0.9-branch/examples/minimal). Follow the instructions in the notebook.

## Usage

### Prerequisites

Start by preparing your Kubernetes cluster using one of the [infrastructure components](https://combinator.ml/infrastructure/introduction/) or use your own cluster.

### Component Usage

```terraform
module "feast" {
  source  = "combinator-ml/feast/k8s"
  # Optional settings go here
}
```

See the full configuration options below.

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
