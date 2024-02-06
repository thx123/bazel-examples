# Examples of Bazel usage

Note: `examples_bazel`is named with an underscore to comply with the Python package naming style (i.e. no `-`):
https://peps.python.org/pep-0008/#descriptive-naming-styles

## cpp
Hello World C++ example with dependency

## cpp_sanitizers
Hello World C++ example to demonstrate C++ address sanitizer

## cpp_stm32
Hello World C++ example for STM32g4

## grpc_cpp
gRPC hello world example in C++ with protobuf dependency.

## grpc_go
gRPC hello world example in Go with protobuf dependency.

## protos
Proto buffer example, where no `protoc` run is required, and the generated classes do not need to be checked into the source control system, but generated dynamically for their dependency targets.

## py
Hello World example for Python with dependency

## pybind11
Example of Python >> C++ call using https://registry.bazel.build/modules/pybind11_bazel
