# bazel-examples
Bazel hello-world examples for C++, Go, Python, including custom toolchain setups for embedded C++ (KR260 &amp; STM32 for Linux or bare metal C++ running on ARM processors), pybind11 and gRPC server/clients running in various languages on Intel and/or ARM processors.

## Instructions

### Download this repo
```
git clone https://github.com/thx123/bazel-examples.git
```

#### Additional steps for For MacOS
Ubuntu on Intel processors are supported out of the box. Since not all C++ toolchains exist to cross-compilation for KR260 and STM32, you'd have to run a docker container on Mac to build inside an Ubuntu image running on Intel processors.

1. Start a long running container based on an multi-platform image that supports both Linux and MacOS:
```
docker run -itd -v $(realpath .):/home/builder/workspace --name bazel-examples thx123/ubuntu-with-bazel
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
