#!/bin/bash -l
export JOBID=NO_BATCH
module use /Users/mathomp4/modulefiles/Core
module load appleclang-flang/22 openmpi/5.0.10

set -x
export PATH=/home/mathomp4/.homebrew/brew/bin:$PATH
export ESMF_DIR=/Users/mathomp4/ESMF_Testing/llvm_22.1_openmpi_O_feature_darwin-work/esmf
export ESMF_COMPILER=llvm
export ESMF_COMM=openmpi
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /Users/mathomp4/ESMF_Testing/llvm_22.1_openmpi_O_feature_darwin-work/module-test.log
export WORK_ROOT=/Users/mathomp4/ESMF_Testing/llvm_22.1_openmpi_O_feature_darwin-work
export TEMP_ROOT=/Users/mathomp4/ESMF_Testing/llvm_22.1_openmpi_O_feature_darwin-work
cd $TEMP_ROOT/esmf
export ESMF_DIR=`pwd`
make install 2>&1| tee $WORK_ROOT/install.log
make all_tests 2>&1| tee $WORK_ROOT/test.log
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
export CMAKE_PREFIX_PATH=$(dirname $ESMFMKFILE)/cmake/ESMF:${CMAKE_PREFIX_PATH}
cd ../nuopc-app-prototypes
./testProtos.sh 2>&1| tee $WORK_ROOT/nuopc.log
ssh gs6101-alderaan.ndc.nasa.gov /Users/mathomp4/ESMF_Testing/llvm_22.1_openmpi_O_feature_darwin-work/esmpy_install.bat
cd /Users/mathomp4/ESMF_Testing/llvm_22.1_openmpi_O_feature_darwin-work
conda activate /Users/mathomp4/ESMF_Testing/conda_environments/esmf-test-scripts-environment-GEOSpyD/26.3.2-0/3.14
. esmpy_venv/bin/activate
cd /Users/mathomp4/ESMF_Testing/llvm_22.1_openmpi_O_feature_darwin-work/esmf/src/addon/esmpy
make test 2>&1| tee /Users/mathomp4/ESMF_Testing/llvm_22.1_openmpi_O_feature_darwin-work/esmpy-test.log
deactivate
conda deactivate
