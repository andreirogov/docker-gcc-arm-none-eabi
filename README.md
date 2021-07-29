# gcc-arm-none-eabi

Docker image for [GNU Arm Embedded Toolchain](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm) 
with Make.

This image can be used either interactively or as part of a CI build.

For interactive use: 
```
$ docker run -it --rm -v $(pwd):/home/dev arogov/gcc-arm-make-alpine
```
