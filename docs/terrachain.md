# Terrachain (alpha)

The purpose of the "terrachain" format is to enable the execution of a sequence of terraform modules, feeding the output of one into the input for another.
In particular this enables workflows where one module creates a Kubernetes cluster, and a later module deploys _into_ that Kubernetes cluster.

See [the Terraform documentation](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs#stacking-with-managed-kubernetes-cluster-resources) and [this GitHub issue](https://github.com/hashicorp/terraform/issues/2430#issuecomment-800192314) for motivation.

Example of a configuration that terrachain can apply:

```
apiVersion: combinator.ml/v1alpha1
modules:
  # The modules get terraform-applied in order, with the outputs from each
  # being passed into the inputs to the next. It is up to the module authors to
  # ensure the inputs & outputs match up in such a way that they are mutually
  # compatible.
  - name: aks
    repo: https://github.com/combinator-ml/terraform-azure-kubernetes
    args:
      autoscaling: on
  - name: kfp
    repo: https://github.com/combinator-ml/terraform-k8s-kfp
```

Or a simpler example, just installing mlflow onto an existing Kubernetes cluster (assumes kubeconfig file in default location or `KUBECONFIG` or similar env var is set):

```
apiVersion: combinator.ml/v1alpha1
modules:
  - name: mlflow
    repo: https://github.com/combinator-ml/terraform-k8s-mlflow
```

The terrachain format can be consumed by the [Combinator app](https://app.combinator.ml) and the [SAME project](https://sameproject.org/) with:
```
same init -f
```

As a special case, if a provider outputs a variable called `kubeconfig_contents`, that file will be written to a temporary file and then the path to the temporary file passed to later modules in both `KUBECONFIG` and `KUBE_CONFIG_PATH` environment variables for convenience.

If no `KUBE_CONFIG_PATH` variable is set, and no previous module outputs a `kubeconfig_contents`, terrachain will set it to `~/.kube/config` to workaround [this issue](https://github.com/terraform-aws-modules/terraform-aws-eks/issues/1234).

There are some sample terrachain configs at [https://github.com/combinator-ml/stacks](https://github.com/combinator-ml/stacks).
