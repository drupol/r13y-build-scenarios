# Reproducible Build Scenarios

This project contains a collection of build scenarios for various programming
languages and build tools. The goal is to provide a set of reproducible build
scenarios that can be used to test and compare reproducibility in space and time
(different build environments, different time).

Github has been chosen as the platform for this project because it provides a
convenient way to run the builds on different architectures and operating
systems through Github Actions.

## Architectures

The tested architectures are:

- `x86_64-linux` (`ubuntu-20.04`)
- `x86_64-linux` (`ubuntu-22.04`)
- `x86_64-darwin` (`macos-12`)
- `aarch64-darwin` (`macos-14`)

## Scenarios

### Scenario 1

Build a C program using the host C compiler.

### Scenario 2

Build a C program in a Docker container using the C compiler.

Base image:

- `alpine`

### Scenario 3

Build a C program using Guix.

### Scenario 4

Build a C program using Nix legacy (not flake).

### Scenario 5

Build a C program using Nix flake.

### Scenario 6

Build an OCI image using Nix flake.

### Scenario 7

Build a PDF document using Typst.

### Scenario 8

Fix scenario 7 and build a reproducible PDF document using Typst.
