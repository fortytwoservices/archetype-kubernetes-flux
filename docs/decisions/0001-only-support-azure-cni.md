# Only support Azure CNI

## Status

Proposed

## Context

When creating an AKS cluster, we have to chose what type of network we want. The default is Kubenet, which is less IP intensive, but is harder to integrate against other Azure services. We usually default to using the Azure CNI plugin, which gives all pods on the cluster an IP from the subnet it is integrated with.

## Decision

We always default to using Azure CNI, and we will either take care of the virtual network and subnets from the archetype. Later we can create a variable that makes it possible to define an already existing subnet, so that it can be part of a bigger deployment scenario that uses one virtual network.

## Consequences

One has to define a CIDR range, and until we have the flexibility for "bring-your-own-resources" the archetype will create a resource group, virtual network and subnet.
