load("@rules_foreign_cc//foreign_cc:defs.bzl", "cmake")

package(default_visibility = ["//visibility:public"])

# Dependency of cppzmq
cmake(
    # Note: This exact name is required to make "cppzmq cmake target work.
    name = "ZeroMQ",
    # This uses Ninja to build under the hood, which is faster than make.
    generate_args = ["-GNinja"],
    lib_source = "@zeromq//:all_srcs",
    out_static_libs = ["libzmq.a"],
)

cmake(
    name = "cppzmq",
    # This uses Ninja to build under the hood, which is faster than make.
    generate_args = ["-GNinja"],
    lib_source = "@cppzmq//:all_srcs",
    deps = [":ZeroMQ"],
    tags = ["requires-network"],
    # cppzmq is a C++ Header wrapper of libzmq (ZeroMQ lib)
    out_headers_only = True,
)

