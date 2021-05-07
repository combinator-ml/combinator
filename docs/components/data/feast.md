# Feast

The [Feast](https://feast.dev) component creates a cloud-native feature store.

- [Website](https://github.com/combinator-ml/terraform-k8s-feast)

## Getting Started

### Installation

1. Prepare your k8s cluster
2. Install the component by following the instructions in the component's README.md

### Usage

1. Port forward the bundled Jupyter instance, which by default is running in the `feast` namespace:

    ```
    kubectl port-forward $(kubectl -n feast get pod -l app=feast-jupyter -o custom-columns=:metadata.name) 8888:8888 -n feast
    ```

2. Browse to built in `minimal/minimal_ride_hailing.ipynb` notebook and run the steps.

> **NOTE: The notebook includes several local Spark commands, which take a long time to complete on smaller clusters.**
