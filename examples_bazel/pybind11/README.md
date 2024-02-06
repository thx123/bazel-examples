# Bazel / pybind11 sample

## How to build, run and test
```
bazelist test :all
```

Expected output:
```
...
INFO: Build completed successfully, 1 total action
PASSED: //examples_bazel/pybind11:example_test (see /home/htie/.cache/bazel/_bazel_htie/2d30c5ddfb59cf25a45a5169064ca8f8/execroot/_main/bazel-out/k8-fastbuild/testlogs/examples_bazel/pybind11/example_test/test.log)
INFO: From Testing //examples_bazel/pybind11:example_test
==================== Test output for //examples_bazel/pybind11:example_test:
about to import
imported, about to call
done!
python is sys.version_info(major=3, minor=10, micro=13, releaselevel='final', serial=0)
pid is 12
5
================================================================================
//examples_bazel/pybind11:example_test                          (cached) PASSED in 0.1s
```

## References
* https://github.com/pybind/pybind11_bazel
* https://github.com/cdleary/bazel_pybind_sample
