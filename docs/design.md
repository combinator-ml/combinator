# Design and Standards

Imagine this. You've been given the task of testing a new piece of ML software. Maybe you want to integrate it into your stack or maybe you just want to try it out. In our experience we spent a non-trivial amount of time attempting to get the stack running, especially when there are multiple components involved.

Combinator attempts to simplify the deployment of common ML stacks. We hope that over time these could become "standardized" stacks, which people use as the ground truth when, for example, stating dependencies.

To achieve this goal we need to define some principals, otherwise there can be no standardization. This isn't formal, like in the bureaucratic sense of the word, but it does aim to be a pattern, to ensure consistency throughout the codebase and make it easier for users to comprehend. To than end, this document serves as a set of opinions (which may change over time) that all code must adhere to.

## Overview

There are three types of code in this project: components, stacks, and infra.

- **Components** provide the smallest possible amount of functionality. Ideally they solve one specific MLOps-related problem and are usually a single project - obvious exceptions are things like Kubeflow. Components are flexible enough to be reused in several stacks.
- **Stacks** are a combination of components that produce a suite of functionality. Stacks are reusable modules too, but they should only comprise of low-level components.
- **Infrastructure** represents infrastructure components that are required to run stacks and components. Typically this defaults to Kubernetes, but all cloud resources are allowed.

All three are managed as terraform code, to make it portable enough to work with any cloud, and to be able to install and/or control all elements throughout the stack. This allows combinator to use best-of-breed resources, like provision Kubernetes clusters with GPUs, or applications through the use of Helm charts. And all with a single dependency, Terraform.

## Standards

All components, stacks, and infrastructure must:

- Be packaged as a terraform module.
- Be published in the [Terraform Registry](https://registry.terraform.io) to make it easier to install.
- Target Kubernetes, where possible.
- Have an accompanying page on https://github.com/combinator-ml/combinator

All components, stacks, and infrastructure should:

- Be concise. For example, if an application can run in memory, it should; include extra storage in a stack. But if it _needs_ a database to work, you must bundle the database into the component if it can’t deploy one itself.
- Only expose options for variations if they have the same interface. When a component or stack can have multiple sub-components, only include those that provide a like-for-like experience. For example, including the option to select Minio or S3 is great. But selecting whether to include Kubeflow or Sagemaker is not; that should be a separate stack.
- Expose all pertinent parameters, in anticipation of future use cases.
- Use semantic versioning to inform users about changes.
- Be packaged with working examples, to allow users to spin up the component quickly.

Components must not:

- Make breaking changes (unless impossible to avoid). Where breaking changes are necessary, bump the major version and make a big scary announcement.

## Creating Components or Stacks

There is little practical difference between components and stacks, other than the level of abstraction. Therefore we recommend the following layout (a basic terraform module layout):

```
├── .github             # (Optional) Use github actions to ensure quality
│   └── workflows
│       ├── documentation.yaml
│       └── terraform.yaml
├── .gitignore
├── .header.md          # (Optional) Part of the final README.md
├── .terraform-docs.yml # (Optional) A way of automatically generating terraform docs from a github action
├── LICENSE
├── README.md
├── examples
│   └── basic
│       └── main.tf
├── locals.tf
├── component-technology-0.tf
├── component-technology-1.tf
├── outputs.tf
├── providers.tf
└── variables.tf
```

### Checklist

Before you announce your component/stack/infrastructure module, make sure you have:

- [ ] Created a basic, k8s-native example
- [ ] Created a useful README explaining what it does and how to use it
- [ ] Submitted a PR to the [Combinator.ml website](https://github.com/combinator-ml/combinator), to update the core documentation
- [ ] Published your module on the [Terraform Registry](https://registry.terraform.io)
- [ ] Checked and adhered to the [contributing guide](CONTRIBUTING.md)
