#!/bin/bash -l
export JOBID=NO_BATCH
module load cmake/tw2cvya
module load gcc/kykcamd mpich/hzpi4g4
module load netcdf-c/ldj2txz netcdf-fortran/ye4ptq7

set -x
export ESMPY_DATA_DIR="/usr/local/esmf/esmf-testing/esmf-test-data/grids"
export ESMF_DIR=/Users/theurich/ESMF-Nightly-Testing/gfortranclang_14.2.0_17.0.0_mpich_g_fix_cmake-config/esmf
export ESMF_COMPILER=gfortranclang
export ESMF_COMM=mpich
export ESMF_NETCDF=nc-config
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /Users/theurich/ESMF-Nightly-Testing/gfortranclang_14.2.0_17.0.0_mpich_g_fix_cmake-config/module-build.log
export WORK_ROOT=/Users/theurich/ESMF-Nightly-Testing/gfortranclang_14.2.0_17.0.0_mpich_g_fix_cmake-config
export TEMP_ROOT=/Users/theurich/ESMF-Nightly-Testing/gfortranclang_14.2.0_17.0.0_mpich_g_fix_cmake-config
cd $TEMP_ROOT/esmf
export ESMF_DIR=`pwd`
set -o pipefail
make info 2>&1| tee $WORK_ROOT/info.log
make -j 8 2>&1| tee $WORK_ROOT/build.log
