#!/bin/bash -l
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
cd /Users/mathomp4/ESMF_Testing/llvm_22.1_openmpi_O_feature_darwin-work/esmf
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
/Users/mathomp4/ESMF_Testing/esmf-test-scripts/py_env_creation/py_env_create --path /Users/mathomp4/ESMF_Testing/conda_environments --file environment-GEOSpyD/26.3.2-0/3.14.yml
cd /Users/mathomp4/ESMF_Testing/llvm_22.1_openmpi_O_feature_darwin-work
conda activate /Users/mathomp4/ESMF_Testing/conda_environments/esmf-test-scripts-environment-GEOSpyD/26.3.2-0/3.14
rm -rf esmpy_venv
python3 -m venv --system-site-packages esmpy_venv
. esmpy_venv/bin/activate
cd /Users/mathomp4/ESMF_Testing/llvm_22.1_openmpi_O_feature_darwin-work/esmf/src/addon/esmpy
python3 -m pip install . 2>&1| tee /Users/mathomp4/ESMF_Testing/llvm_22.1_openmpi_O_feature_darwin-work/esmpy-install.log
make download 2>&1| tee /Users/mathomp4/ESMF_Testing/llvm_22.1_openmpi_O_feature_darwin-work/esmpy-download.log
deactivate
conda deactivate
