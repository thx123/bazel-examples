load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library")

cc_library(
    name = "hello-greet",
    srcs = ["hello-greet.cc"],
    hdrs = ["hello-greet.h"],
)

cc_binary(
    name = "hello-world",
    srcs = ["hello-world.cc"],
    # static linking to overcome the version mismatch problem of
    # libc.so.6 and libstdc++.so.6 between host and target environments.
    linkopts = ["-static"],
    deps = [
        ":hello-greet",
    ],
)
