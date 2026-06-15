#!/bin/bash -l
module load cmake
module load gcc/kykcamd openmpi/a7f5nwa
module load netcdf-c/pywk6et netcdf-fortran/busq63s

set -x
export ESMPY_DATA_DIR="/usr/local/esmf/esmf-testing/esmf-test-data/grids"
export ESMF_DIR=/Users/theurich/ESMF-Nightly-Testing/nag_7.2.44_openmpi_g_feature_darwin-work/esmf
export ESMF_COMPILER=nag
export ESMF_COMM=openmpi
export ESMF_NETCDF=nc-config
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
cd /Users/theurich/ESMF-Nightly-Testing/nag_7.2.44_openmpi_g_feature_darwin-work/esmf
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
/Users/theurich/ESMF-Nightly-Testing/esmf-test-scripts/py_env_creation/py_env_create --path /Users/theurich/ESMF-Nightly-Testing/conda_environments --file environment-python3.11-numpy1.26.yml
cd /Users/theurich/ESMF-Nightly-Testing/nag_7.2.44_openmpi_g_feature_darwin-work
conda activate /Users/theurich/ESMF-Nightly-Testing/conda_environments/esmf-test-scripts-environment-python3.11-numpy1.26
rm -rf esmpy_venv
python3 -m venv --system-site-packages esmpy_venv
. esmpy_venv/bin/activate
cd /Users/theurich/ESMF-Nightly-Testing/nag_7.2.44_openmpi_g_feature_darwin-work/esmf/src/addon/esmpy
python3 -m pip install . 2>&1| tee /Users/theurich/ESMF-Nightly-Testing/nag_7.2.44_openmpi_g_feature_darwin-work/esmpy-install.log
make download 2>&1| tee /Users/theurich/ESMF-Nightly-Testing/nag_7.2.44_openmpi_g_feature_darwin-work/esmpy-download.log
deactivate
conda deactivate
