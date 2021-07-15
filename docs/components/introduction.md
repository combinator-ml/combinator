# Introduction

Combinator components are intend to be best-of-breed point-solutions for specific ML problems. A combination of components build a stack.

Since there are multiple components that attempt to solve the same problem, components can be organized into catagories. These are:

- [Data](#data)
- [Develop](#develop)
- [Deploy](#deploy)
- [Monitor](#monitor)
- [Govern](#govern)

Undoubtedly there are components that cross boundaries. When this happens, they are listed in multiple catagories.

## Data

- [Minio](data/minio.md) - S3 API compatible cloud-native storage
- [Pachyderm](data/pachyderm.md) - Data lineage (version control)
- [Feast](data/feast.md) - Feature store
- [Istio](data/istio.md) - Service mesh

## Develop

- [Pachyderm](data/pachyderm.md) - Pipelines
- [Jupyter](develop/jupyter.md) - Notebooks
- [Kubeflow](develop/kubeflow.md) - Pipelines, Notebooks, Training

## Deploy

- KFServing - Serving
- [Seldon](deploy/seldon.md) - Serving and monitoring

## Monitor

- Boxkite - Cloud-native model monitoring
- [Seldon](deploy/seldon.md) - Serving and monitoring

## Govern

- [MLFlow](govern/mlflow.md) - Model management
