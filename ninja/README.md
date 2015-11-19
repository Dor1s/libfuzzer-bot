This page describes an [xperimental fuzzer bot(currently disabled) for [Ninja](https://github.com/martine/ninja).

The bot uses [libFuzzer](http://llvm.org/docs/LibFuzzer.html) and
[AddressSanitizer](http://clang.llvm.org/docs/AddressSanitizer.html) to find existing
bugs in Ninja and possible new regressions.

The test corpus is synthesised from:
* [misc/afl-fuzz/build.ninja](https://github.com/martine/ninja/blob/master/misc/afl-fuzz/build.ninja) 
