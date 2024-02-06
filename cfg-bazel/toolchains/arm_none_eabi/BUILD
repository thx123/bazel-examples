load("@arm_none_eabi//toolchain:toolchain.bzl", "arm_none_eabi_toolchain")

package(
    default_visibility = ["//visibility:public"],
)

# TODO(htie@): Find out how to put this in here.
#     ctx.attr.compile_definitions = [
#         "STM32G431xx",
#         "USE_HAL_DRIVER",
#         "ARM_COMPILER",
#     ]

# Common flags shared by all STM32 toolchains
common_flags = {
    "copts": [
        "-fdata-sections",
        "-ffunction-sections",
        "--specs=nano.specs",
        "-Wl,--gc-sections",
        "-Wall",
        "-Wextra",
        "-Wpedantic",
        "-Wno-unused-parameter",
				# common cpu parameters
        "-mthumb",
        "-mfpu=fpv4-sp-d16",
        #"-mfloat-abi=hard",
    ],
    "linkopts": [
        "-nostartfiles",
        "-Wl,--start-group",
        "--specs=nosys.specs",
        "-lc",
        "-lm",
        "-Wl,--end-group",
        "-Wl,--print-memory-usage",
				# common cpu parameters
        "-mthumb",
        "-mfpu=fpv4-sp-d16",
        #"-mfloat-abi=hard",
    ],
}

arm_none_eabi_toolchain(
    name = "cortex_m4_toolchain",
    target_compatible_with = [
        "@platforms//os:none",
        "//cfg-bazel/cpu:cortex_m4"
    ],
    copts = [
        "-mcpu=cortex-m4",
    ] + common_flags["copts"],
    linkopts = [
        "-mcpu=cortex-m4",
    ] + common_flags["linkopts"],
)

