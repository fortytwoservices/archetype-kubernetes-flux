# Kubernetes with Flux

This archetype is an application platform with Kubernetes as the base, and GitOps with Flux as the application delivery method. The goal is to have a standardized way of creating platform environments that can be easily combined with our other platform deployment scenarios. At the moment we will only be writing Terraform for an Azure deployment, using Azure Kubernetes Service, but all concepts described is universal and can easily be adopted to other providers later on.

Long term goal for this root module is to have a deployment of AKS, based on a what we feel should be a typical deployment, with Flux bootstrapped to a specified repository on creation.
