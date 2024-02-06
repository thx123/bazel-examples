# gRPC C++ Hello World Example

You can find a complete set of instructions for building gRPC and running the
Hello World app in the [C++ Quick Start][].

[C++ Quick Start]: https://grpc.io/docs/languages/cpp/quickstart

(Simplified) [Code Example Source](https://github.com/grpc/grpc/tree/master/examples/cpp/helloworld)

To run gRPC server client example:

1. Start running the gRPC server:
```
bazel run :greet_server
```
Notice that the server starts and waits for connections:

2. In a separate terminal, run the gRPC client:
```
bazel run :greet_client
```
Notice that the client finishes successfully with the returned message from the gRPC server,
and that the server log has been updated to handle the new connection.
