FROM rockylinux:9.3

WORKDIR /app/

RUN dnf install -y clang lld \
    && dnf install -y cmake make \
    && dnf clean all

RUN rm -rf /lib64/libomp*

# Standard rockylinux image with build dependencies