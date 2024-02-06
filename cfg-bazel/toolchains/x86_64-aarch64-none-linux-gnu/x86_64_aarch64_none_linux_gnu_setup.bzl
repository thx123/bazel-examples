load(":cc_toolchain_config.bzl", "cc_toolchain_config")

def setup_x86_64_aarch64_none_linux_gnu_cc_toolchain():
    cc_toolchain_config(
        name = "x86_64_aarch64_none_linux_gnu_toolchain_config",
        toolchain_ref = "@x86_64_aarch64_none_linux_gnu//:all_files",
    )
    
    native.cc_toolchain(
        name = "x86_64_aarch64_none_linux_gnu_cc_toolchain",
        toolchain_identifier = "x86_64_aarch64_none_linux_gnu",
        toolchain_config = ":x86_64_aarch64_none_linux_gnu_toolchain_config",
        all_files = "@x86_64_aarch64_none_linux_gnu//:all_files",
        ar_files = "@x86_64_aarch64_none_linux_gnu//:ar_files",
        compiler_files = "@x86_64_aarch64_none_linux_gnu//:compiler_files",
        dwp_files = "@x86_64_aarch64_none_linux_gnu//:empty",
        linker_files = "@x86_64_aarch64_none_linux_gnu//:linker_files",
        objcopy_files = "@x86_64_aarch64_none_linux_gnu//:objcopy",
        strip_files = "@x86_64_aarch64_none_linux_gnu//:strip",
        supports_param_files = 0,
    )
    
    native.cc_toolchain_suite(
        name = "x86_64_aarch64_none_linux_gnu_cc_toolchain_suite",
        toolchains = {
            "aarch64": ":x86_64_aarch64_none_linux_gnu_cc_toolchain",
        },
        tags = ["manual"]
    )
    
    native.toolchain(
        name = "x86_64_aarch64_none_linux_gnu_toolchain",
        exec_compatible_with = [
            "@platforms//os:linux",
            "@platforms//cpu:x86_64",
        ],
        target_compatible_with = [
            "@platforms//os:linux",
            "@platforms//cpu:aarch64",
        ],
        toolchain = ":x86_64_aarch64_none_linux_gnu_cc_toolchain",
        toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
    )
