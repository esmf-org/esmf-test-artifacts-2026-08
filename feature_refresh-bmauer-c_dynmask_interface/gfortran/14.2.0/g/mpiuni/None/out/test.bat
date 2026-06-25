#!/bin/bash -l
export JOBID=NO_BATCH
module load cmake/tw2cvya
module load gcc/kykcamd 
module load netcdf-c/gn7eliu netcdf-fortran/cjo2h4h

set -x
export ESMPY_DATA_DIR="/usr/local/esmf/esmf-testing/esmf-test-data/grids"
export ESMF_DIR=/usr/local/esmf/esmf-testing/gfortran_14.2.0_mpiuni_g_feature_refresh-bmauer-c_dynmask_interface/esmf
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpiuni
export ESMF_NETCDF=nc-config
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
export ESMF_MPIRUN=/usr/local/esmf/esmf-testing/gfortran_14.2.0_mpiuni_g_feature_refresh-bmauer-c_dynmask_interface/esmf/src/Infrastructure/stubs/mpiuni/mpirun
module list >& /usr/local/esmf/esmf-testing/gfortran_14.2.0_mpiuni_g_feature_refresh-bmauer-c_dynmask_interface/module-test.log
export WORK_ROOT=/usr/local/esmf/esmf-testing/gfortran_14.2.0_mpiuni_g_feature_refresh-bmauer-c_dynmask_interface
export TEMP_ROOT=/usr/local/esmf/esmf-testing/gfortran_14.2.0_mpiuni_g_feature_refresh-bmauer-c_dynmask_interface
cd $TEMP_ROOT/esmf
export ESMF_DIR=`pwd`
make install 2>&1| tee $WORK_ROOT/install.log
make all_tests 2>&1| tee $WORK_ROOT/test.log
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
/usr/local/esmf/esmf-testing/gfortran_14.2.0_mpiuni_g_feature_refresh-bmauer-c_dynmask_interface/esmpy_install.bat
cd /usr/local/esmf/esmf-testing/gfortran_14.2.0_mpiuni_g_feature_refresh-bmauer-c_dynmask_interface
conda activate /usr/local/esmf/esmf-testing/conda_environments/esmf-test-scripts-environment-python3.11-numpy1.26
. esmpy_venv/bin/activate
cd /usr/local/esmf/esmf-testing/gfortran_14.2.0_mpiuni_g_feature_refresh-bmauer-c_dynmask_interface/esmf/src/addon/esmpy
make test 2>&1| tee /usr/local/esmf/esmf-testing/gfortran_14.2.0_mpiuni_g_feature_refresh-bmauer-c_dynmask_interface/esmpy-test.log
deactivate
conda deactivate
