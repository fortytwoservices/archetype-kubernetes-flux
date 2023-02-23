# Archetype: Kubernetes with Flux

This repository contains our archetype for deploying Kubernetes with Flux. At the moment we are building it for AKS, with a set number of common application deployments.

## What is an archetype

Our platform services are build on a couple of components. The lowest level of these are what we call archetypes, which is a Terraform root module with a defined deployment. These archetypes has to be flexible, but still flexible enough to support any use-cases we would encounter with our managed services.
