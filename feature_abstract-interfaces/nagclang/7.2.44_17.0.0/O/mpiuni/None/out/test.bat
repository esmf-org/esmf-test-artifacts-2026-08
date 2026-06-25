#!/bin/bash -l
export JOBID=NO_BATCH
module load cmake
module load None 
module load netcdf-c/hth7a6z netcdf-fortran/oboy4y3

set -x
export ESMPY_DATA_DIR="/usr/local/esmf/esmf-testing/esmf-test-data/grids"
export ESMF_DIR=/Users/theurich/ESMF-Nightly-Testing/nagclang_7.2.44_17.0.0_mpiuni_O_feature_abstract-interfaces/esmf
export ESMF_COMPILER=nagclang
export ESMF_COMM=mpiuni
export ESMF_NETCDF=nc-config
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
export ESMF_MPIRUN=/Users/theurich/ESMF-Nightly-Testing/nagclang_7.2.44_17.0.0_mpiuni_O_feature_abstract-interfaces/esmf/src/Infrastructure/stubs/mpiuni/mpirun
module list >& /Users/theurich/ESMF-Nightly-Testing/nagclang_7.2.44_17.0.0_mpiuni_O_feature_abstract-interfaces/module-test.log
export WORK_ROOT=/Users/theurich/ESMF-Nightly-Testing/nagclang_7.2.44_17.0.0_mpiuni_O_feature_abstract-interfaces
export TEMP_ROOT=/Users/theurich/ESMF-Nightly-Testing/nagclang_7.2.44_17.0.0_mpiuni_O_feature_abstract-interfaces
cd $TEMP_ROOT/esmf
export ESMF_DIR=`pwd`
make install 2>&1| tee $WORK_ROOT/install.log
make all_tests 2>&1| tee $WORK_ROOT/test.log
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
export CMAKE_PREFIX_PATH=$(dirname $ESMFMKFILE)/cmake/ESMF:${CMAKE_PREFIX_PATH}
/Users/theurich/ESMF-Nightly-Testing/nagclang_7.2.44_17.0.0_mpiuni_O_feature_abstract-interfaces/esmpy_install.bat
cd /Users/theurich/ESMF-Nightly-Testing/nagclang_7.2.44_17.0.0_mpiuni_O_feature_abstract-interfaces
conda activate /Users/theurich/ESMF-Nightly-Testing/conda_environments/esmf-test-scripts-environment-python3.11-numpy1.26
. esmpy_venv/bin/activate
cd /Users/theurich/ESMF-Nightly-Testing/nagclang_7.2.44_17.0.0_mpiuni_O_feature_abstract-interfaces/esmf/src/addon/esmpy
make test 2>&1| tee /Users/theurich/ESMF-Nightly-Testing/nagclang_7.2.44_17.0.0_mpiuni_O_feature_abstract-interfaces/esmpy-test.log
deactivate
conda deactivate
