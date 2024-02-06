# Example for cross-compiling C++ targets for multiple target environments

## To compile for the native host environment (Ubuntu Linux on x86_64):

```
bazel build :all
```
Note that only the `:functions` target is built, but not the `:main` target, as
the `BUILD` file specifies that it's only compatible with the STM32g4 target
environment.

## To cross-compile for the foreign target environment (STM32g4):

```
bazel build :all --config=stm32g4
```

Note that both the `:functions` target and the `:main` targets are built, since
the build command explicitly asks to build for stm32g4 platform which matches
the cc_binary's target enrironment.

