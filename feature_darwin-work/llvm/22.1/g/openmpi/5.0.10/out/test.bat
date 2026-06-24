#!/bin/bash -l
export JOBID=NO_BATCH
module use /Users/mathomp4/modulefiles/Core
module load appleclang-flang/22 openmpi/5.0.10

set -x
export ESMF_TRACE_LIB_BUILD=OFF
export ESMPY_DATA_DIR="/Users/mathomp4/ESMF_Testing/esmf-test-data/grids"
export PATH=/home/mathomp4/.homebrew/brew/bin:$PATH
export ESMF_DIR=/Users/mathomp4/ESMF_Testing/llvm_22.1_openmpi_g_feature_darwin-work/esmf
export ESMF_COMPILER=llvm
export ESMF_COMM=openmpi
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /Users/mathomp4/ESMF_Testing/llvm_22.1_openmpi_g_feature_darwin-work/module-test.log
export WORK_ROOT=/Users/mathomp4/ESMF_Testing/llvm_22.1_openmpi_g_feature_darwin-work
export TEMP_ROOT=/Users/mathomp4/ESMF_Testing/llvm_22.1_openmpi_g_feature_darwin-work
cd $TEMP_ROOT/esmf
export ESMF_DIR=`pwd`
make install 2>&1| tee $WORK_ROOT/install.log
make all_tests 2>&1| tee $WORK_ROOT/test.log
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
export CMAKE_PREFIX_PATH=$(dirname $ESMFMKFILE)/cmake/ESMF:${CMAKE_PREFIX_PATH}
cd ../nuopc-app-prototypes
./testProtos.sh 2>&1| tee $WORK_ROOT/nuopc.log
