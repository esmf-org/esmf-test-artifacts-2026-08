#!/bin/bash -l
#SBATCH --account=s3113
#SBATCH -o /gpfsm/dnb34/gtheuric/ESMF-Nightly-Testing/gfortran_14.2.0_openmpi_g_fix_cmake-config/build.bat_%j.o
#SBATCH -e /gpfsm/dnb34/gtheuric/ESMF-Nightly-Testing/gfortran_14.2.0_openmpi_g_fix_cmake-config/build.bat_%j.e
#SBATCH --time=1:00:00
#SBATCH --partition=compute
#SBATCH -C mil
#SBATCH --qos=allnccs
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=120
#SBATCH --exclusive
export JOBID=$SLURM_JOBID


module use /discover/swdev/gmao_SIteam/modulefiles-SLES15
module load cmake/3.30.3
module load comp/gcc/14.2.0 mpi/openmpi/4.1.6/gcc-14.2.0
module load other/esmf-netcdf/gfortran_14.2.0-openmpi_4.1.6

set -x
export ESMF_DIR=/gpfsm/dnb34/gtheuric/ESMF-Nightly-Testing/gfortran_14.2.0_openmpi_g_fix_cmake-config/esmf
export ESMF_COMPILER=gfortran
export ESMF_COMM=openmpi
export ESMF_NETCDF=nc-config
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /gpfsm/dnb34/gtheuric/ESMF-Nightly-Testing/gfortran_14.2.0_openmpi_g_fix_cmake-config/module-build.log
export WORK_ROOT=/gpfsm/dnb34/gtheuric/ESMF-Nightly-Testing/gfortran_14.2.0_openmpi_g_fix_cmake-config
export TEMP_ROOT=/gpfsm/dnb34/gtheuric/ESMF-Nightly-Testing/gfortran_14.2.0_openmpi_g_fix_cmake-config
cd $TEMP_ROOT/esmf
export ESMF_DIR=`pwd`
set -o pipefail
make info 2>&1| tee $WORK_ROOT/info.log
make -j 120 2>&1| tee $WORK_ROOT/build.log
