# Validate folders of Terraform configurations 
This repository is for the GitHub Action to validate multiple terraform configurations in a folder. It is useful when you have a folder containing multiple folders of multiple terraform configurations.

# How it works

## Inputs

* `path`

  Path to the folder containing terraform configurations

  - Type: string
  - Optional
  - Default: The action workspace

* `max_depth`

  How many folders maximum deep do you want to look for terraform files

  - Type: string
  - Optional
  - Default: 2


* `min_depth`

  How many folders minimum deep do you want to look for terraform files. 

  - Type: string
  - Optional
  - Default: 1


* `directories`

  String of directories in path to validate terraform in, separated by commas. If provided, only these folders will be validated.

  - Type: string
  - Optional
  - Default: ""