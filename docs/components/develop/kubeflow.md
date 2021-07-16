# Kubeflow

**tl; dr;** A [combinator](https://combinator.ml) governance component that provides [Kubeflow](https://kubeflow.org), a pipelining tool, Jupyter host, and hyperparameter tuner.

- [Introduction](#introduction)
- [Test Drive](#test-drive)
- [Usage](#usage)

## Introduction

[Kubeflow](https://kubeflow.org) is an open-source MLOps platform that combines Jupyter hosting, ML pipelining, and hyperparameter tuning. It is packaged into a single UI to help data scientists train their ML models.

Kubeflow Pipelines (KFP) in particular, has emerged as one eminent ML pipelinging technology, mainly thanks to the managed hosting in various clouds.

Its opinionated ML-specific API helps data scientists and ML engineers develop robust, repeatable pipelines.

### Kubeflow Version

This installation uses Kubeflow version 1.2, which is now out of date.

### Status and Recommendations

:warning: **For Testing Only** :warning:

This installation method is not recommended for use. It required a lot of work-arounds that are not suitable for production use. Please refer to the [official documentation](https://www.kubeflow.org/docs/started/installing-kubeflow/) for production installation instructions.

## Test Drive

The fastest way to get started is to use the test drive functionality provided by [TestFaster](https://testfaster.ci). Click on the "Launch Test Drive" button below (opens a new window).

<a href="https://testfaster.ci/launch?embedded=true&amp;repo=https://github.com/combinator-ml/terraform-k8s-kubeflow&amp;file=examples/testfaster/.testfaster.yml" target="\_blank">:computer: Launch Test Drive :computer:</a>

## Usage

### Prerequisites

Start by preparing your Kubernetes cluster using one of the [infrastructure components](https://combinator.ml/infrastructure/introduction/) or use your own cluster.

### Component Usage

```terraform
module "kubeflow" {
  source  = "combinator-ml/kubeflow/k8s"
  # Optional settings go here
}
```

See the full configuration options below.

### Instructions

Kubeflow is big, so it can take some time to start. Once it does connect to the istio ingress gateway service.

Once you see the login screen, the username is `admin@kubeflow.org` and the password is `12341234`.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| helm | = 2.2.0 |
| k8s | = 0.9.1 |
| kubernetes | = 2.3.2 |

## Providers

No provider.

## Modules

| Name | Source | Version |
|------|--------|---------|
| kubeflow | ./terraform-module-kubeflow |  |

## Resources

No resources.

## Inputs

No input.

## Outputs

No output.
