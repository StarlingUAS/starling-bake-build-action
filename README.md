# starling-bake-build-action
Github Action for building (baking) starling modules

This composite action will do the following:
1. Checkout the current project
2. Runs a script which parses the current branch to work out 
  - *VERSION* set to current tag (e.g. v0.1.1) if current branch is `latest_branch`, else set to the branch name
  - *RELEASE* set to `latest` if current branch is in `latest_branch`, else not set
  - *CACHEFROM* set to `cache` if current branch is `latest_branch` or `cache-dev` otherwise
  - *CACHETO* set to `cache` if current branch is `latest_branch`, `cache-dev` if current branch is `dev_branch`, else and empty string 
3. If `build_arm64` is true, qemu is started up. 
4. Set up docker buildx
5. Login to dockerhub
6. Build `target` specified in `bakefile` and push if `push` is specified
 
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
  login:
    description: 'Perform Login to registry'
    required: false
    default: true
  registry:
    description: 'Registry to login to'
    required: false
    default: docker.io
  registry_username: 
    description: 'Registry Username'
    required: true
  registry_password: 
    description: 'Registry Password'
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
  load:
    description: 'Load from local repository'
    required: false
    default: false
  prefix:
    description: 'Prefix to use for images'
    required: false
    default: uobflightlabstarling
   
outputs: 
  release:
    description: 'Release name of the system'
    value: ${{ steps.release_tag_cache.outputs.release }}
  version:
    description: 'Version name of the system'
    value: ${{ steps.release_tag_cache.outputs.version }}
```