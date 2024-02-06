package(
    default_visibility = ["//visibility:public"],
)

platform(
    name = "linux_x86_64",
    constraint_values = [
        "@platforms//os:linux",
        "@platforms//cpu:x86_64",
    ],
)

platform(
    name = "macos_aarch64",
    constraint_values = [
        "@platforms//os:macos",
        "@platforms//cpu:aarch64",
    ],
)

platform(
    name = "windows_x86_64",
    constraint_values = [
        "@platforms//os:windows",
        "@platforms//cpu:x86_64",
    ],
)

platform(
    # KR260 A-Core running on Petaliux
    name = "kr260_a",
    # Reference: https://developer.arm.com/Processors/Cortex-A53
    constraint_values = [
        # Note: Using Linux as the closest to Petalinux from:
        # OS List: https://github.com/bazelbuild/platforms/blob/main/os/BUILD
        "@platforms//os:linux",
        # CPU List: https://github.com/bazelbuild/platforms/blob/main/cpu/BUILD
        "@platforms//cpu:aarch64",
    ],
)

platform(
    # KR260 R-Core running on bare metal
    name = "kr260_r",
    # Reference: https://developer.arm.com/Processors/Cortex-R5
    constraint_values = [
        # Note: Using Linux as the closest to Petalinux from:
        "@platforms//os:none",
        # CPU List: https://github.com/bazelbuild/platforms/blob/main/cpu/BUILD
        "@platforms//cpu:aarch64",
    ],
)

platform(
    # STM32G4 MCUs
    # https://www.st.com/en/microcontrollers-microprocessors/stm32g4-series.html
    name = "stm32g4",
    constraint_values = [
        "@platforms//os:none",
        "//cfg-bazel/cpu:cortex_m4"
    ],
)

