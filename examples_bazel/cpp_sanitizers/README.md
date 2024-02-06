# Demonstration of C++ sanitizer usages

## Address sanitizer:

Regular build and run would be fine:
```
bazelisk run :main_missing_free
```

But build and run in address sanitizer mode will fail:

```
bazelisk run -c dbg --config=asan :main_missing_free
```

and the following error would be expected:

```
INFO: Running command line: bazel-bin/examples_bazel/cpp_sanitizers/main_missing_free
string is: Hello world!

=================================================================
==1553723==ERROR: LeakSanitizer: detected memory leaks

Direct leak of 100 byte(s) in 1 object(s) allocated from:
    #0 0x7f6efdab4887 in __interceptor_malloc ../../../../src/libsanitizer/asan/asan_malloc_linux.cpp:145
    #1 0x55d841129a5f in main examples_bazel/cpp_sanitizers/main_missing_free.cc:8
    #2 0x7f6efd229d8f in __libc_start_call_main ../sysdeps/nptl/libc_start_call_main.h:58

SUMMARY: AddressSanitizer: 100 byte(s) leaked in 1 allocation(s).
```

## More info:

* [Address / Thread / Memory / Undefined Behavior Sanitizer Definitions](https://github.com/bazelment/trunk/blob/master/tools/bazel.rc)

* [More examples to try](https://www.osc.edu/resources/getting_started/howto/howto_use_address_sanitizer)
