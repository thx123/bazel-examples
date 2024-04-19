# bazel-examples
Bazel hello-world examples for C++, Go, Python, including custom toolchain setups for embedded C++ ([KR260](https://www.xilinx.com/products/som/kria/kr260-robotics-starter-kit.html) and [STM32](https://en.wikipedia.org/wiki/STM32) with ARM processors), pybind11 and gRPC server/clients running in various languages on Intel and/or ARM processors. The background and motiviation of this project can be found at [bazel-discuss@](https://groups.google.com/g/bazel-discuss/c/eScnfnQU21I).

## Instructions

### Download this repo
```
git clone https://github.com/thx123/bazel-examples.git
```

#### Additional steps for MacOS
Ubuntu on Intel processors are supported out of the box. However, since not all C++ toolchains exist to cross-compile [KR260](https://www.xilinx.com/products/som/kria/kr260-robotics-starter-kit.html) and [STM32](https://en.wikipedia.org/wiki/STM32) targets from the MacOS, you'd have to run a docker container on Mac to build inside an Ubuntu image running on Intel processors.

1. Start a long running container based on an multi-platform image that supports both Linux and MacOS:
```
docker run -itd -v $(realpath .):/home/builder/workspace --name bazel-examples thx123/ubuntu-with-bazel:latest
```
More information about the Docker image can be found at [dockerhub](https://hub.docker.com/repository/docker/thx123/ubuntu-with-bazelisk/general).

2. Connect to the container:
```
docker exec -it bazel-examples /bin/bash
cd bazel-examples
```

### Build and Test
To build and test: 

```
bazel build //...
```

```
bazel test //...
```

### Gitlab-Runner Integration
If your source code lives on a GitLab instance, the following can be added for CI/CD, e.g. e.g. in `.gitlab-ci.yml`:

```
stages:
  - build
  - test

.bazel-common:
  variables:
    GIT_SUBMODULE_STRATEGY: none
  before_script:
    - echo "Using ./bazel-common ..."

bazel-build:
  image:
    name: thx123/ubuntu-with-bazelisk:1.5
    entrypoint: [""]
  stage: build
  extends: .bazel-common
  script:
    - bazel --bazelrc=./cfg-bazel/bazelrc/gitlab-runner.aws.rc info
    - bazel --bazelrc=./cfg-bazel/bazelrc/gitlab-runner.aws.rc build //...

bazel-test:
  image:
    name: thx123/ubuntu-with-bazelisk:1.5
    entrypoint: [""]
  stage: test
  extends: .bazel-common
  script:
    - bazel --bazelrc=./cfg-bazel/bazelrc/gitlab-runner.aws.rc info
    - bazel --bazelrc=./cfg-bazel/bazelrc/gitlab-runner.aws.rc test //...
```

