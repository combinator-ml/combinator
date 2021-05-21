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

### Tutorial

We've created some helpful templates to make it easier to get started developing a component or stack. Follow the steps to get started.

#### 1. Create a Repo from a Template

First create your new repository and base it upon the [combinator template](https://github.com/combinator-ml/terraform-template). If you are working within the combinator organization, then you can use Github's template functionality. Otherwise, just merge the repo into yours.

The template provides the following functionality:

- Good initial structure
- Github actions to: publish docs to the main combinator site, generate terraform documentation, create release notes, lint, test the terraform code

#### 2. Release to the Terraform Registry

Create your first release, `0.0.0` by convension, browse to the [Terraform registry](https://registry.terraform.io/github/create) and publish a new **module**. Once generated it should show your template repo.

#### 3. Update the Code and Examples

Now you need to go through all the Terraform code and implement your component. Take a look at the other components for examples using Helm to install your application, or leverage other modules to create a stack, for example.

#### 4. Update the Documentation

Now go through the `.header.md` file and update your README. This file will be pushed to the combinator.ml website, so make sure it makes sense outside of the context of the repository.

#### 5. Create a PR

Push your code to a branch and create a PR. This will kick off the various Github actions. This step is important because if you just push to master, it won't regenerate the documentation.

Make sure all the actions pass, then merge the PR.

#### 6. Merge the Combinator Docs

Now browse to the [combinator repository](https://github.com/combinator-ml/combinator/pulls) and look at the PR that your documentation action created. Make sure everything is in order and request a merge from one of the project's admins.

#### 7. Celebrate and Share

Now share your success! Tell us about the experience on Slack! Share with your colleagues! Share on social media! Spread the love!
