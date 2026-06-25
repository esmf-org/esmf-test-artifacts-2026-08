#!/bin/bash -l
export JOBID=NO_BATCH
module load cmake
module load None 
module load netcdf-c/hth7a6z netcdf-fortran/oboy4y3

set -x
export ESMPY_DATA_DIR="/usr/local/esmf/esmf-testing/esmf-test-data/grids"
export ESMF_DIR=/Users/theurich/ESMF-Nightly-Testing/nagclang_7.2.44_17.0.0_mpiuni_g_feature_abstract-interfaces/esmf
export ESMF_COMPILER=nagclang
export ESMF_COMM=mpiuni
export ESMF_NETCDF=nc-config
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
export ESMF_MPIRUN=/Users/theurich/ESMF-Nightly-Testing/nagclang_7.2.44_17.0.0_mpiuni_g_feature_abstract-interfaces/esmf/src/Infrastructure/stubs/mpiuni/mpirun
module list >& /Users/theurich/ESMF-Nightly-Testing/nagclang_7.2.44_17.0.0_mpiuni_g_feature_abstract-interfaces/module-build.log
export WORK_ROOT=/Users/theurich/ESMF-Nightly-Testing/nagclang_7.2.44_17.0.0_mpiuni_g_feature_abstract-interfaces
export TEMP_ROOT=/Users/theurich/ESMF-Nightly-Testing/nagclang_7.2.44_17.0.0_mpiuni_g_feature_abstract-interfaces
cd $TEMP_ROOT/esmf
export ESMF_DIR=`pwd`
set -o pipefail
make info 2>&1| tee $WORK_ROOT/info.log
make -j 8 2>&1| tee $WORK_ROOT/build.log
