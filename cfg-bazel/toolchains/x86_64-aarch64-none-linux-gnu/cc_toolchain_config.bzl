load("@bazel_tools//tools/build_defs/cc:action_names.bzl", "ACTION_NAMES")
load("@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl",
    "feature",
    "flag_group",
    "flag_set",
    "tool_path",
)

all_link_actions = [
    ACTION_NAMES.cpp_link_executable,
    ACTION_NAMES.cpp_link_dynamic_library,
    ACTION_NAMES.cpp_link_nodeps_dynamic_library,
]

all_compile_actions = [
    ACTION_NAMES.assemble,
    ACTION_NAMES.c_compile,
    ACTION_NAMES.clif_match,
    ACTION_NAMES.cpp_compile,
    ACTION_NAMES.cpp_header_parsing,
    ACTION_NAMES.cpp_module_codegen,
    ACTION_NAMES.cpp_module_compile,
    ACTION_NAMES.linkstamp_compile,
    ACTION_NAMES.lto_backend,
    ACTION_NAMES.preprocess_assemble,
]

def _impl(ctx):
    tool_paths = [
        tool_path(
            name = "ar",
            path = ctx.attr.toolchain_ref.label.workspace_root + "/bin/aarch64-none-linux-gnu-ar",
        ),
        tool_path(
            name = "cpp",
            path = ctx.attr.toolchain_ref.label.workspace_root + "/bin/aarch64-none-linux-gnu-cpp",
        ),
        tool_path(
            name = "gcc",
            path = ctx.attr.toolchain_ref.label.workspace_root + "/bin/aarch64-none-linux-gnu-gcc",
        ),
        tool_path(
            name = "gcov",
            path = ctx.attr.toolchain_ref.label.workspace_root + "/bin/aarch64-none-linux-gnu-gcov",
        ),
        tool_path(
            name = "ld",
            path = ctx.attr.toolchain_ref.label.workspace_root + "/bin/aarch64-none-linux-gnu-ld",
        ),
        tool_path(
            name = "nm",
            path = ctx.attr.toolchain_ref.label.workspace_root + "/bin/aarch64-none-linux-gnu-nm",
        ),
        tool_path(
            name = "objdump",
            path = ctx.attr.toolchain_ref.label.workspace_root + "/bin/aarch64-none-linux-gnu-objdump",
        ),
        tool_path(
            name = "strip",
            path = ctx.attr.toolchain_ref.label.workspace_root + "/bin/aarch64-none-linux-gnu-strip",
        ),
    ]

    default_compiler_flags = feature(
        name = "default_compiler_flags",
        enabled = True,
        flag_sets = [
            flag_set(
                actions = all_compile_actions,
                flag_groups = [
                    flag_group(
                        flags = [
                            # "--sysroot=external/_main~non_module_dependencies~x86_64_aarch64_none_linux_gnu/aarch64-none-linux-gnu",
                            "--sysroot=" + ctx.attr.toolchain_ref.label.workspace_root + "/aarch64-none-linux-gnu/libc",
                            "-no-canonical-prefixes",
                            "-fno-canonical-system-headers",
                            "-Wno-builtin-macro-redefined",
                            "-D__DATE__=\"redacted\"",
                            "-D__TIMESTAMP__=\"redacted\"",
                            "-D__TIME__=\"redacted\"",
                        ],
                    ),
                ],
            ),
        ],
    )
    
    default_linker_flags = feature(
        name = "default_linker_flags",
        enabled = True,
        flag_sets = [
            flag_set(
                actions = all_link_actions,
                flag_groups = ([
                    flag_group(
                        flags = [
                            # "--sysroot=external/_main~non_module_dependencies~x86_64_aarch64_none_linux_gnu/aarch64-none-linux-gnu",
                            "--sysroot=" + ctx.attr.toolchain_ref.label.workspace_root + "/aarch64-none-linux-gnu/libc",
                            "-lstdc++",
                            # WARNING: do not add static linking flags like "-static" or "-static-libstdc++" here;
                            # otherwise cross-compilation for ARM processors will fail.
                            "-lm",
                        ],
                    ),
                ]),
            ),
        ],
    )

    features = [
        default_compiler_flags,
        default_linker_flags,
    ]

    return cc_common.create_cc_toolchain_config_info(
        ctx = ctx,
        features = features,
        toolchain_identifier = "x86_64_aarch64_none_linux_gnu_cc_toolchain",
        host_system_name = "local",
        target_system_name = "unknown",
        target_cpu = "unknown",
        target_libc = "unknown",
        compiler = "unknown",
        abi_version = "unknown",
        abi_libc_version = "unknown",
        tool_paths = tool_paths,
    )

cc_toolchain_config = rule(
    implementation = _impl,
    attrs = {
        "toolchain_ref": attr.label(),
    },
    provides = [CcToolchainConfigInfo],
)
