#!/bin/bash -l
#SBATCH --account=s3113
#SBATCH -o /gpfsm/dnb34/gtheuric/ESMF-Nightly-Testing/llvm_22.1.0_mpich_g_fix_cmake-config/test.bat_%j.o
#SBATCH -e /gpfsm/dnb34/gtheuric/ESMF-Nightly-Testing/llvm_22.1.0_mpich_g_fix_cmake-config/test.bat_%j.e
#SBATCH --time=2:00:00
#SBATCH --partition=compute
#SBATCH -C mil
#SBATCH --qos=allnccs
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=120
#SBATCH --exclusive
export JOBID=$SLURM_JOBID


module use /discover/swdev/gmao_SIteam/modulefiles-SLES15
module load cmake/3.30.3
module load comp/llvm-flang/22.1.0 mpi/mpich/4.3.2/llvm-flang-22.1.0

set -x
export ESMF_DIR=/gpfsm/dnb34/gtheuric/ESMF-Nightly-Testing/llvm_22.1.0_mpich_g_fix_cmake-config/esmf
export ESMF_COMPILER=llvm
export ESMF_COMM=mpich
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /gpfsm/dnb34/gtheuric/ESMF-Nightly-Testing/llvm_22.1.0_mpich_g_fix_cmake-config/module-test.log
export WORK_ROOT=/gpfsm/dnb34/gtheuric/ESMF-Nightly-Testing/llvm_22.1.0_mpich_g_fix_cmake-config
export TEMP_ROOT=/gpfsm/dnb34/gtheuric/ESMF-Nightly-Testing/llvm_22.1.0_mpich_g_fix_cmake-config
cd $TEMP_ROOT/esmf
export ESMF_DIR=`pwd`
make install 2>&1| tee $WORK_ROOT/install.log
make all_tests 2>&1| tee $WORK_ROOT/test.log
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
export CMAKE_PREFIX_PATH=$(dirname $ESMFMKFILE)/cmake/ESMF:${CMAKE_PREFIX_PATH}
cd ../nuopc-app-prototypes
./testProtos.sh 2>&1| tee $WORK_ROOT/nuopc.log
