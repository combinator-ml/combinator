# Bodywork + MLflow

This tutorial enables you to experiment with Bodywork and MLflow combined into a single open-source MLOps stack. [Bodywork](https://github.com/bodywork-ml/bodywork-core) is a tool that focuses on the deployment of machine learning projects to Kubernetes. [MLflow](https://www.mlflow.org) is a tool for managing the machine learning lifecycle (tracking metrics and managing ML arteacts, such as trained models).

We have developed an example train-and-serve pipeline to demonstrate Bodywork and MLflow working side-by-side, which you can explore in [this GitHub repository](https://github.com/bodywork-ml/bodywork-pipeline-with-mlflow). The pipeline uses MLflow to track the training metrics and manage trained models. The pipeline consists of two stages, defined in two executable Python modules:

1. `train_model.py` - run a batch job to train a model, logging metrics and registering models to MLflow.
2. `serve_model.py` - loads the latest 'production' model from MLflow and then starts a simple Flask app to handle requests for scoring data.

The details of the deployment are described in the `bodywork.yaml` configuration file. When a deployment is triggered, Bodywork instructs Kubernetes to start pre-built [Bodywork containers](https://hub.docker.com/repository/docker/bodyworkml/bodywork-core), that pull the code from the demo project's Git repo and run the executable Python modules. Each stage is associated with one Python module and is run, in isolation, in it's own container.

Launch the test drive below and follow the steps to see this pipeline in action!

![bodywork](https://bodywork-media.s3.eu-west-2.amazonaws.com/ml_pipeline_with_mlflow.png)

## Step 0 - Launch the Test Drive

**Note: the test drive doesn't work in Safari yet. Please use Chrome or Firefox for now! Also please note it won't work in Private/Incognito windows.**

Use the following test drive to launch a temporary Kubernetes cluster with the tutorial running in it:

<script>
function toggle(el) {
  var x = document.getElementById(el);
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}
</script>

<a id="button" class="md-button md-button--primary" href="javascript:void(0);" onclick="document.getElementById('testdrive').src=document.getElementById('testdrive').getAttribute('data-src'); toggle('testdrive'); toggle('button')">Launch Test Drive</a>

<iframe width="1024" height="300" id="testdrive" data-src="https://testfaster.ci/launch?embedded=true&repo=https://github.com/combinator-ml/terraform-k8s-stack-bodywork-mlflow&file=terraform-module-bodywork/.testfaster.yml" style="display:none"></iframe>

At busy times, you may need to wait a few minutes for a test drive environment to become available.

**Note that the environment will shut down automatically 1 hour after you start using it.**

### Step 1 - Deploy the Pipeline

To test the deployment using a local workflow-controller that streams logs to stdout, run,

```text
$ bodywork workflow \
    --namespace=bodywork \
    https://github.com/bodywork-ml/bodywork-pipeline-with-mlflow \
    master
```

Once the deployment has completed, browse to the MLflow UI to check that the model metrics that were logged to the `iris-classification` experiment during training, and to confirm that the trained model, `iris-classifier--sklearn-decision-tree`, was registered and promoted to 'production'.

## Step 2 - Test the Scoring Service

Requests to score data can now be sent to the scoring service. Try the following in the shell,

```text
$ curl http://localhost:31380/bodywork/bodywork-mlflow-demo--scoring-service/iris/v1/score \
    --request POST \
    --header "Content-Type: application/json" \
    --data '{"sepal_length": 5.1, "sepal_width": 3.5, "petal_length": 1.4, "petal_width": 0.2}'
```

Which should return,

```json
{
    "species_prediction":"setosa",
    "probabilities":"setosa=1.0|versicolor=0.0|virginica=0.0",
    "model_info": "DecisionTreeClassifier(class_weight='balanced', random_state=42)"
}
```

According to how the payload has been defined in the `serve_model.py` module.

## Running the ML Pipeline on a Schedule

If you're happy with the test results, you can schedule the workflow-controller to operate remotely on the cluster, on a pre-defined schedule. For example, to setup the the workflow to run every hour, use the following command,

```text
$ bodywork cronjob create \
    --namespace=bodywork \
    --name=train-and-deploy \
    --schedule="0 * * * *" \
    --git-repo-url=https://github.com/bodywork-ml/bodywork-bodywork-mlflow-demo-project \
    --git-repo-branch=master
```

Each scheduled workflow will attempt to re-run the batch-job, as defined by the state of this repository's `master` branch at the time of execution.

To get the execution history for all `train-and-deploy` jobs use,

```text
$ bodywork cronjob history \
    --namespace=bodywork \
    --name=train-and-deploy
```

Which should return output along the lines of,

```text
JOB_NAME                                START_TIME                    COMPLETION_TIME               ACTIVE      SUCCEEDED       FAILED
train-and-deploy-1605214260             2020-11-12 20:51:04+00:00     2020-11-12 20:52:34+00:00     0           1               0
```

## Cleaning Up

To clean-up the deployment in its entirety, delete the namespace using kubectl - e.g. by running,

```text
$ kubectl delete ns bodywork
```

## Make this Project Your Own

This repository is a [GitHub template repository](https://docs.github.com/en/free-pro-team@latest/github/creating-cloning-and-archiving-repositories/creating-a-repository-from-a-template) that can be automatically copied into your own GitHub account by clicking the `Use this template` button above.

After you've cloned the template project, use official [Bodywork documentation](https://bodywork.readthedocs.io/en/latest/) to help modify the project to meet your own requirements.
