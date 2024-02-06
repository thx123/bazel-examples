#
# External Bazel module dependencies that are not in Bazel Central Registry
# Note: This file has to be put in the root directory; otherwise Bazel will
# have trouble interpreting its path.
#

# Background: https://bazel.build/external/migration
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# This is needed to build 3rd-party non-Bazel modules (e.g. external projects
# that are based on CMake, Autotools, or other build systems).
# Background: https://bazelbuild.github.io/rules_foreign_cc/main/cmake.html
_ALL_CONTENT = """\
filegroup(
    name = "all_srcs",
    srcs = glob(["**"]),
    visibility = ["//visibility:public"],
)
"""

# 3rd party Bazel modules not in Bazel Central Registry
def status_macros():
    """absl::Status macros.
    They should have come with Abseil by default.
    See: https://github.com/jimrogerz/status_macros#usage
    """
    if "status_macros" not in native.existing_rules():
        git_repository(
            name = "status_macros",
            commit = "1592ab2d4b4f92976fc3f4a6cb3a1323a4b549c3",
            remote = "https://github.com/jimrogerz/status_macros.git",
        )

# 3rd party non-Bazel modules that are not in Bazel Central Registry
def zeromq():
    """required by cppzmq below"""
    if "zeromq" not in native.existing_rules():
        http_archive(
            name = "zeromq",
            urls = ["https://github.com/zeromq/libzmq/releases/download/v4.3.5/zeromq-4.3.5.tar.gz"],
            strip_prefix = "zeromq-4.3.5",
            build_file_content = _ALL_CONTENT,
        )

def cppzmq():
    if "cppzmq" not in native.existing_rules():
        http_archive(
            name = "cppzmq",
            urls = ["https://github.com/zeromq/cppzmq/archive/refs/tags/v4.10.0.tar.gz"],
            strip_prefix = "cppzmq-4.10.0",
            build_file_content = _ALL_CONTENT,
        )

# 3rd party non-Bazel modules that are not in Bazel Central Registry: Special toolchain repos
def x86_64_aarch64_none_linux_gnu():
    """required for C/C++ cross-compilation from X86_64 build environment to AARCH64 target environment"""
    if "x86_64_aarch64_none_linux_gnu" not in native.existing_rules():
        http_archive(
            # Arm GNU Toolchain Downloads homepage:
            # https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads
            name = "x86_64_aarch64_none_linux_gnu",
            patch_args = ["-p1"],
            patches = ["//cfg-bazel/toolchains/x86_64-aarch64-none-linux-gnu:libX_so.patch"],
            urls = ["https://developer.arm.com/-/media/Files/downloads/gnu/13.2.rel1/binrel/arm-gnu-toolchain-13.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz?rev=22c39fc25e5541818967b4ff5a09ef3e&hash=E7676169CE35FC2AAECF4C121E426083871CA6E5"],
            sha256 = "12fcdf13a7430655229b20438a49e8566e26551ba08759922cdaf4695b0d4e23",
            strip_prefix = "arm-gnu-toolchain-13.2.Rel1-x86_64-aarch64-none-linux-gnu",
            # build_file = "@//cfg-bazel/toolchains/x86_64-aarch64-none-linux-gnu:BUILD.repo",
            build_file = Label("//cfg-bazel/toolchains/x86_64-aarch64-none-linux-gnu:BUILD.repo"),
        )


def _non_module_dependencies_impl(_ctx):
    status_macros()
    zeromq()
    cppzmq()
    x86_64_aarch64_none_linux_gnu()

non_module_dependencies = module_extension(
    implementation = _non_module_dependencies_impl,
)

