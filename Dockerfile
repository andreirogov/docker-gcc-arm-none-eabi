FROM alpine:latest as builder

# Toolchain tarball URL
ARG TOOLCHAIN_TAR_URL=https://developer.arm.com/-/media/Files/downloads/gnu-rm/10-2020q4/gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2

RUN cd /tmp && \
  apk add --no-cache curl tar && \
  curl -L ${TOOLCHAIN_TAR_URL} -o gcc-arm-none-eabi.tar && \
  tar -xf gcc-arm-none-eabi.tar && \
  rm -rf gcc-arm-none-eabi-*/share/doc

FROM frolvlad/alpine-glibc:latest

# Install make
RUN apk add --no-cache make

COPY --from=builder /tmp/gcc-arm-none-eabi-*/* /home/dev/gcc-arm-none-eabi

# Setup environment
ENV PATH="/home/dev/gcc-arm-none-eabi/bin:${PATH}"

WORKDIR /usr/project

ENTRYPOINT ["ceedling"]
CMD ["help"]
