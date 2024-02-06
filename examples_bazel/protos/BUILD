load("@rules_proto//proto:defs.bzl", "proto_library")
# More info: https://rules-proto-grpc.com/en/latest/lang/cpp.html
load("@rules_proto_grpc_cpp//:defs.bzl", "cpp_proto_library", "cpp_grpc_library")

package(
    default_visibility = ["//visibility:public"],
)

proto_library(
    name = "helloworld_proto",
    srcs = ["helloworld.proto"],
)

cpp_proto_library(
    name = "helloworld_cc_proto",
    protos = [":helloworld_proto"],
)

cpp_grpc_library(
    name = "helloworld_cpp_grpc",
    protos = [":helloworld_proto"],
)

proto_library(
    name = "routeguide_proto",
    srcs = ["routeguide.proto"],
)

cpp_proto_library(
    name = "routeguide_cc_proto",
    protos = [":routeguide_proto"],
)

cpp_grpc_library(
    name = "routeguide_cpp_grpc",
    protos = [":routeguide_proto"],
)

filegroup(
    name = "routeguide_features",
    srcs = ["routeguide_features.json"],
)

