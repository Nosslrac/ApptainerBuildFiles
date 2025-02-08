# Apptainer instructions
This file has a collection of the useful apptainer and docker build commands for building and running containers on the Vera cluster.

## Build 
```sh
apptainer build test.sif NPB-OMPbuild.def
apptainer build [local options...] <IMAGE PATH> <BUILD SPEC>
```

## Running
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