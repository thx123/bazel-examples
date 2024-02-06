# C++ Hello World Example
Example from: https://github.com/bazelbuild/examples/tree/main/cpp-tutorial/stage2

## First, take a look at the `BUILD` file.
It should be pretty self-explanatory. When in doubt, check the official Bazel documentation
for [C / C++ Rules](https://bazel.build/reference/be/c-cpp).

## To build hello-world:
```
bazel build :hello-world
```

## To run hello-world (which will automatically trigger builds if it has not done so):
```
bazel run :hello-world
```

Alternatively, you may also run the generated executable directly, by going back to the amp-software root folder, and run:

```
bazel-bin/examples_bazel/cpp/hello-world
```

## To cross-compile the same target for the KR260 A core:
```
bazel build :hello-world --config=kr260_a
```
You may verify that the binary above can no longer run on Intel processors, but can run once copied into a KR260. 
