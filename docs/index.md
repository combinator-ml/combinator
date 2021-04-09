# Easy MLOps Stacks

Sophisticated teams develop their MLOps stack from a combination of best of breed components. This open source community exists to make combining them less of a headache.

<figure>
  <img src="images/stacks.webp" width="600" />
  <figcaption><small>Credit: <a href="https://towardsdatascience.com/the-problem-with-ai-developer-tools-for-enterprises-and-what-ikea-has-to-do-with-it-b26277841661">Clemens Mewald</a></small></figcaption>
</figure>

## How It Works

Combinator.ml makes it easy to test drive, combine & deploy the stack that's best for you.

### ![Terraform](images/terraform.webp){ width=200 }

Terraform is the common language we use to combine stacks.

Don't worry if you're not familiar with it, we make it easy to get started with it.

You can deploy a test drive, local dev environment or into the clouds of your choice.

### ![GitHub](images/github.webp){ width=200 }

Every component is published as a terraform module in an open source GitHub repo.

Each stack is a terraform module too, which references the terraform modules of the components.

We need your help to maintain these! Fork them and contribute PRs please!

If you want to add a new one under our GitHub org, join us on `#mlops-stacks` on the [MLOps.community Slack](https://go.mlops.community/slack).


## MLOps Categories

Stacks are typically developed from components in the following categories.

| Category       | Description | |
| ----------     | ----------- | |
| **Data**       | Data forms the backbone of any MLOps effort. | [**Explore**](categories/data.md) |
| **Training**   | Create models in exploratory or production-grade modes. | [**Explore**](categories/training.md) |
| **Deployment** | Deploy your models to integrate them & get business value. | [**Explore**](categories/deployment.md) |
| **Monitoring** | Understand the behavior of your models in production. | [**Explore**](categories/monitoring.md) |


## Featured Stacks

!!! abstract inline "Kubeflow + MLflow"
    *By combinator.ml*

    Kubeflow provides orchestration for notebooks, pipelines, and serving. This stack adds MLflow for model management and makes it easy to log models to MLflow from kubeflow notebooks and pipelines.

    [**View**](stacks/kubeflow-mlflow.md){ .md-button }


!!! abstract inline "ClearML + KFServing"
    *By combinator.ml*

    ClearML provides experiment tracking, training orchestration and data tracking. This integration plugs it into KFServing for model deployment.

    [**View**](stacks/clearml-kfserving.md){ .md-button }

<div style="clear:both;"></div>

!!! abstract inline "Juju: Kubeflow + MLflow"
    *By Canonical*

    Juju from Canonical allows easy combination of technologies: this example uses Juju relations to integrate Kubeflow with MLflow and Seldon Core, as well as Prometheus.

    [**View**](stacks/juju-kubeflow-mlflow-seldon.md){ .md-button }

!!! abstract inline "Boxkite + Kubeflow"
    *By Basis-AI*

    Boxkite from Basis-AI is an open source project to compare training-time and deployment-time data distributions. KL divergence implemented in PromQL! This stack shows it running in conjunction with Kubeflow, MLflow, Seldon, Prometheus & Grafana.

    [**View**](stacks/boxkite-kubeflow.md){ .md-button }

<div style="clear:both;"></div>

!!! abstract inline "Pachyderm + Seldon"
    *By Pachyderm*

    Use Pachyderm to train a model, and Seldon to deploy it, with full data version control & provenance.

    [**View**](stacks/pachyderm-seldon.md){ .md-button }

!!! abstract inline "SAME + Kubeflow + MLflow"
    *By Microsoft*

    The SAME project, from David Aronchick, founder of Kubeflow at the Microsoft Office of the CTO, provides an easy CLI user experience for data scientists to create reproducible workflows.

    [**View**](stacks/same-kubeflow-mlflow.md){ .md-button }

<div style="clear:both;"></div>

## Community Founders

* [Luke Marsden](https://www.linkedin.com/in/luke-marsden-71b3789/) - MLOps Consulting
* [Phil Winder](https://www.linkedin.com/in/drphilwinder/) - Winder Research
* [Demetrios Brinkmann](https://www.linkedin.com/in/dpbrinkm/) - MLOps Community
* [Kai Davenport](https://www.linkedin.com/in/kai-davenport-228b6017/) - MLOps Consulting

## Get involved!

Find us in `#mlops-stacks` on the MLOps.community Slack

[Join Slack :rocket:](https://go.mlops.community/slack){ .md-button .md-button--primary }
