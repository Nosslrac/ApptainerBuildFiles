# Apptainer instructions
This project is a collection of handy build scripts for building apptainer images based on base docker images. The intended use is 
to build a custom ```openmp``` runtime which is linked with a custom bench mark.
This file has a collection of the useful apptainer and docker build commands for building and running containers on the Vera cluster.

## Docker building base image with build dependencies
```sh
docker build -t rockylinux .
docker save -o rockyBase.tar rocklinux:9.3
```
Currently, the ````Dockerfile``` builds a Rocky linux 9.3 base image with build dependencies for the openmp and NPB-CPP benchmark.

## Apptainer build from docker archive
```sh
apptainer build test.sif NPB-OMPbuild.def
apptainer build [local options...] <IMAGE PATH> <BUILD SPEC>
```
Builds a minimal Rocky Linux image with NPB-CPP benchmark.

## Running apptainer container
```sh
apptainer run --containall --no-home --bind "/local/path/:/app/output/" --env BENCH_SIZE=A test.sif
```

## Posting on Vera
```sh
scp /path/to/sif <cid>@vera1.c3se.chalmers.se:/path/on/vera
```

## Environment
```sh
%environment is made available when running the container: stored in file that is sourced at runtime
env --containall/--cleanenv container discards host environment variables if any of these are specified
```