load("@rules_python//python:defs.bzl", "py_binary", "py_library", "py_test")

py_library(
    name = "greeter_lib",
    srcs = ["greeter.py"],
)

py_binary(
    name = "hello_world",
    srcs = ["hello_world.py"],
    deps = [
        ":greeter_lib",
    ],
    visibility = ["//visibility:public"]
)
