# terraform-k8s-jupyter

**tl; dr;** A [combinator](https://combinator.ml) data component that provides a single [Jupyter](https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html) instance, a notebook provider.

- [Introduction](#introduction)
- [Test Drive](#test-drive)
- [Usage](#usage)

## Introduction

[Jupyter](https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html) is an open-source notebook host. Data scientists use notebooks to research, develop, and document their solutions. However, it is also very useful to use when demonstrating other products where the user persona is an engineer or scientist.

Hence, this component is generally used within other stacks to enable demos. The functionality of this component is intended to help provide those demos.

If you are more interested in a notebook platform, then check out [Jupyter Hub](https://jupyter.org/hub), or any cloud vendor notebook hosting solution.

## Test Drive

The fastest way to get started is to use the test drive functionality provided by [TestFaster](https://testfaster.ci). Click on the "Launch Test Drive" button below (opens a new window).

<a href="https://testfaster.ci/launch?embedded=true&amp;repo=https://github.com/combinator-ml/terraform-k8s-jupyter&amp;file=examples/testfaster/.testfaster.yml" target="\_blank">:computer: Launch Test Drive :computer:</a>

### Launch Jupyter

Once the component has launched, click on the Jupyter link. Once inside Jupyter, explore and try some demos.

### Prerequisites

Start by preparing your Kubernetes cluster using one of the [infrastructure components](https://combinator.ml/infrastructure/introduction/) or use your own cluster.

### Component Usage

```terraform
module "feast" {
  source  = "combinator-ml/jupyter/k8s"
  # Optional settings go here
}
```

See the full configuration options below.

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| kubernetes | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [kubernetes_deployment](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment) |
| [kubernetes_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| image | Docker image to use | `string` | `"jupyter/scipy-notebook:python-3.9.2"` | no |
| name\_prefix | Prefix to be used when naming the different components. | `string` | `"combinator"` | no |
| namespace | The namespace to install into. | `string` | `"jupyter"` | no |

## Outputs

No output.
