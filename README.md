# starling-bake-build-action
Github Action for building (baking) starling modules

## Inputs and outputs
```
inputs: 
  bakefile:
    description: 'Bake file path'
    required: true
  target: 
    description: 'Build Target within bake file'
    required: true
  tag: 
    description: 'Release tag'
    required: true
  dockerhub_username: 
    description: 'Dockerhub Username'
    required: true
  dockerhub_password: 
    description: 'Dockerhub Password'
    required: true
  build_arm64: 
    description: 'Set to true if building for arm64'
    required: false
    default: false
  latest_branch:
    description: 'Branch name for latest, otherwise branch name is used. Used to determine release name and caching'
    required: false
    default: master,main
  dev_branch:
    description: 'Branch name for development branch. Used to determine caching'
    required: false
    default: dev
  push:
    description: 'Push to docker hub'
    required: false
    default: true
   
outputs: 
  release:
    description: 'Release name of the system'
    value: ${{ steps.release_tag_cache.outputs.release }}
  version:
    description: 'Version name of the system'
    value: ${{ steps.release_tag_cache.outputs.version }}
```