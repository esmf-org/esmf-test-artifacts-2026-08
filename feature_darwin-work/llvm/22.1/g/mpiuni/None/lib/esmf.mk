# ESMF application makefile fragment
#
# Use the following ESMF_ variables to compile and link
# your ESMF application against this ESMF build.
#
# !!! VERY IMPORTANT: If the location of this ESMF build is   !!!
# !!! changed, e.g. libesmf.a is copied to another directory, !!!
# !!! this file - esmf.mk - must be edited to adjust to the   !!!
# !!! correct new path                                        !!!
#
# Please see end of file for options used on this ESMF build
#

#----------------------------------------------
ESMF_VERSION_STRING=9.0.0 beta snapshot
ESMF_VERSION_STRING_GIT=feature/darwin-work+g6b7171ed19
#----------------------------------------------

ESMF_VERSION_MAJOR=9
ESMF_VERSION_MINOR=0
ESMF_VERSION_REVISION=0
ESMF_VERSION_PATCHLEVEL=0
ESMF_VERSION_PUBLIC='F'
ESMF_VERSION_BETASNAPSHOT='T'


ESMF_APPSDIR=/Users/mathomp4/ESMF_Testing/llvm_22.1_mpiuni_g_feature_darwin-work/esmf/apps/appsg/Darwin.llvm.64.mpiuni.default
ESMF_LIBSDIR=/Users/mathomp4/ESMF_Testing/llvm_22.1_mpiuni_g_feature_darwin-work/esmf/lib/libg/Darwin.llvm.64.mpiuni.default
ESMF_ESMXDIR=/Users/mathomp4/ESMF_Testing/llvm_22.1_mpiuni_g_feature_darwin-work/esmf/src/addon/ESMX
ESMF_CMAKEDIR=/Users/mathomp4/ESMF_Testing/llvm_22.1_mpiuni_g_feature_darwin-work/esmf/cmake


ESMF_F90COMPILER=flang
ESMF_F90LINKER=flang

ESMF_F90COMPILEOPTS=-g   -fPIC  
ESMF_F90COMPILEPATHS=-I/Users/mathomp4/ESMF_Testing/llvm_22.1_mpiuni_g_feature_darwin-work/esmf/mod/modg/Darwin.llvm.64.mpiuni.default -I/Users/mathomp4/ESMF_Testing/llvm_22.1_mpiuni_g_feature_darwin-work/esmf/src/include 
ESMF_F90COMPILECPPFLAGS=-DESMF_NO_INTEGER_1_BYTE -DESMF_NO_INTEGER_2_BYTE -DESMF_VERSION_STRING_GIT='feature/darwin-work+g6b7171ed19' -DESMF_MPIUNI -I/Users/mathomp4/ESMF_Testing/llvm_22.1_mpiuni_g_feature_darwin-work/esmf/src/Infrastructure/stubs/mpiuni -DESMF_LOWERCASE_SINGLEUNDERSCORE -DESMF_MOAB=1 -DESMF_LAPACK=1 -DESMF_LAPACK_INTERNAL=1 -DESMF_NO_ACC_SOFTWARE_STACK=1 -DESMF_YAMLCPP=1 -DESMF_YAML=1 -DESMF_NO_OPENMP -DESMF_NO_OPENACC -DESMF_TESTEXHAUSTIVE -DESMF_BOPT_g -DESMF_TESTPERFORMANCE -DESMF_TESTCOMPTUNNEL -DESMF_TESTWITHTHREADS -DS64=1 -DESMF_OS_Darwin=1 -DESMF_COMM=mpiuni -DESMF_DIR=/Users/mathomp4/ESMF_Testing/llvm_22.1_mpiuni_g_feature_darwin-work/esmf
ESMF_F90COMPILEFREECPP=
ESMF_F90COMPILEFREENOCPP=-ffree-form
ESMF_F90COMPILEFIXCPP=-cpp -ffixed-form
ESMF_F90COMPILEFIXNOCPP=

ESMF_F90LINKOPTS=   -pthread
ESMF_F90LINKPATHS=-L/Users/mathomp4/ESMF_Testing/llvm_22.1_mpiuni_g_feature_darwin-work/esmf/lib/libg/Darwin.llvm.64.mpiuni.default  -Lopt/libomp/lib -L/Users/mathomp4/.homebrew/brew/opt/llvm/lib/clang/22/lib/darwin -L/Users/mathomp4/.homebrew/brew/Cellar/flang/22.1.8/lib
ESMF_F90ESMFLINKPATHS=-L/Users/mathomp4/ESMF_Testing/llvm_22.1_mpiuni_g_feature_darwin-work/esmf/lib/libg/Darwin.llvm.64.mpiuni.default
ESMF_F90LINKRPATHS=-Wl,-rpath,/Users/mathomp4/ESMF_Testing/llvm_22.1_mpiuni_g_feature_darwin-work/esmf/lib/libg/Darwin.llvm.64.mpiuni.default  -Wl,-rpath,/Users/mathomp4/ESMF_Testing/llvm_22.1_mpiuni_g_feature_darwin-work/esmf/lib/libg/Darwin.llvm.64.mpiuni.default -Wl,-rpath,opt/libomp/lib -Wl,-rpath,/Users/mathomp4/.homebrew/brew/opt/llvm/lib/clang/22/lib/darwin -Wl,-rpath,/Users/mathomp4/.homebrew/brew/Cellar/flang/22.1.8/lib
ESMF_F90ESMFLINKRPATHS=-Wl,-rpath,/Users/mathomp4/ESMF_Testing/llvm_22.1_mpiuni_g_feature_darwin-work/esmf/lib/libg/Darwin.llvm.64.mpiuni.default
ESMF_F90LINKLIBS= -lc++
ESMF_F90ESMFLINKLIBS=-lesmf  -lc++

ESMF_CXXCOMPILER=clang++
ESMF_CXXLINKER=clang++

ESMF_CXXCOMPILEOPTS=-std=c++11 -g  -fPIC -pthread
ESMF_CXXCOMPILEPATHS= -I/Users/mathomp4/ESMF_Testing/llvm_22.1_mpiuni_g_feature_darwin-work/esmf/src/include   -I/Users/mathomp4/ESMF_Testing/llvm_22.1_mpiuni_g_feature_darwin-work/esmf/src/prologue/yaml-cpp/include
ESMF_CXXCOMPILECPPFLAGS=-DESMF_NO_INTEGER_1_BYTE -DESMF_NO_INTEGER_2_BYTE -DESMF_VERSION_STRING_GIT='feature/darwin-work+g6b7171ed19' -DESMF_MPIUNI -I/Users/mathomp4/ESMF_Testing/llvm_22.1_mpiuni_g_feature_darwin-work/esmf/src/Infrastructure/stubs/mpiuni -DESMF_LOWERCASE_SINGLEUNDERSCORE -DESMF_MOAB=1 -DESMF_LAPACK=1 -DESMF_LAPACK_INTERNAL=1 -DESMF_NO_ACC_SOFTWARE_STACK=1 -DESMF_YAMLCPP=1 -DESMF_YAML=1 -DESMF_NO_OPENMP -DESMF_NO_OPENACC -DESMF_TESTEXHAUSTIVE -DESMF_BOPT_g -DESMF_TESTPERFORMANCE -DESMF_TESTCOMPTUNNEL -DESMF_TESTWITHTHREADS -DS64=1 -DESMF_OS_Darwin=1 -DESMF_COMM=mpiuni -DESMF_DIR=/Users/mathomp4/ESMF_Testing/llvm_22.1_mpiuni_g_feature_darwin-work/esmf -D__SDIR__='' -DESMF_CXXSTD=11 -x c++

ESMF_CXXLINKOPTS=  -pthread
ESMF_CXXLINKPATHS=-L/Users/mathomp4/ESMF_Testing/llvm_22.1_mpiuni_g_feature_darwin-work/esmf/lib/libg/Darwin.llvm.64.mpiuni.default  -Lopt/libomp/lib -L/Users/mathomp4/.homebrew/brew/opt/llvm/lib/clang/22/lib/darwin -L/Users/mathomp4/.homebrew/brew/Cellar/flang/22.1.8/lib
ESMF_CXXESMFLINKPATHS=-L/Users/mathomp4/ESMF_Testing/llvm_22.1_mpiuni_g_feature_darwin-work/esmf/lib/libg/Darwin.llvm.64.mpiuni.default
ESMF_CXXLINKRPATHS=-Wl,-rpath,/Users/mathomp4/ESMF_Testing/llvm_22.1_mpiuni_g_feature_darwin-work/esmf/lib/libg/Darwin.llvm.64.mpiuni.default  -Wl,-rpath,/Users/mathomp4/ESMF_Testing/llvm_22.1_mpiuni_g_feature_darwin-work/esmf/lib/libg/Darwin.llvm.64.mpiuni.default -Wl,-rpath,opt/libomp/lib -Wl,-rpath,/Users/mathomp4/.homebrew/brew/opt/llvm/lib/clang/22/lib/darwin -Wl,-rpath,/Users/mathomp4/.homebrew/brew/Cellar/flang/22.1.8/lib
ESMF_CXXESMFLINKRPATHS=-Wl,-rpath,/Users/mathomp4/ESMF_Testing/llvm_22.1_mpiuni_g_feature_darwin-work/esmf/lib/libg/Darwin.llvm.64.mpiuni.default
ESMF_CXXLINKLIBS= -lflang_rt.runtime -lSystem
ESMF_CXXESMFLINKLIBS=-lesmf  -lflang_rt.runtime -lSystem

ESMF_CCOMPILER=clang
ESMF_CLINKER=clang

ESMF_CCOMPILEOPTS=-std=c99 -g  -fPIC -pthread
ESMF_CCOMPILEPATHS=-I/Users/mathomp4/ESMF_Testing/llvm_22.1_mpiuni_g_feature_darwin-work/esmf/src/include   -I/Users/mathomp4/ESMF_Testing/llvm_22.1_mpiuni_g_feature_darwin-work/esmf/build_config/Darwin.llvm.default
ESMF_CCOMPILECPPFLAGS=-DESMF_NO_INTEGER_1_BYTE -DESMF_NO_INTEGER_2_BYTE -DESMF_VERSION_STRING_GIT='feature/darwin-work+g6b7171ed19' -DESMF_MPIUNI -I/Users/mathomp4/ESMF_Testing/llvm_22.1_mpiuni_g_feature_darwin-work/esmf/src/Infrastructure/stubs/mpiuni -DESMF_LOWERCASE_SINGLEUNDERSCORE -DESMF_MOAB=1 -DESMF_LAPACK=1 -DESMF_LAPACK_INTERNAL=1 -DESMF_NO_ACC_SOFTWARE_STACK=1 -DESMF_YAMLCPP=1 -DESMF_YAML=1 -DESMF_NO_OPENMP -DESMF_NO_OPENACC -DESMF_TESTEXHAUSTIVE -DESMF_BOPT_g -DESMF_TESTPERFORMANCE -DESMF_TESTCOMPTUNNEL -DESMF_TESTWITHTHREADS -DS64=1 -DESMF_OS_Darwin=1 -DESMF_COMM=mpiuni -DESMF_DIR=/Users/mathomp4/ESMF_Testing/llvm_22.1_mpiuni_g_feature_darwin-work/esmf -D__SDIR__='' -DESMF_CSTD=99

ESMF_CLINKOPTS=  -pthread
ESMF_CLINKPATHS=-L/Users/mathomp4/ESMF_Testing/llvm_22.1_mpiuni_g_feature_darwin-work/esmf/lib/libg/Darwin.llvm.64.mpiuni.default  -Lopt/libomp/lib -L/Users/mathomp4/.homebrew/brew/opt/llvm/lib/clang/22/lib/darwin -L/Users/mathomp4/.homebrew/brew/Cellar/flang/22.1.8/lib -L/Users/mathomp4/ESMF_Testing/llvm_22.1_mpiuni_g_feature_darwin-work/esmf/lib/libg/Darwin.llvm.64.mpiuni.default  -Lopt/libomp/lib -L/Users/mathomp4/.homebrew/brew/opt/llvm/lib/clang/22/lib/darwin -L/Users/mathomp4/.homebrew/brew/Cellar/flang/22.1.8/lib
ESMF_CESMFLINKPATHS=-L/Users/mathomp4/ESMF_Testing/llvm_22.1_mpiuni_g_feature_darwin-work/esmf/lib/libg/Darwin.llvm.64.mpiuni.default
ESMF_CLINKRPATHS=-Wl,-rpath,/Users/mathomp4/ESMF_Testing/llvm_22.1_mpiuni_g_feature_darwin-work/esmf/lib/libg/Darwin.llvm.64.mpiuni.default -Wl,-rpath,opt/libomp/lib -Wl,-rpath,/Users/mathomp4/.homebrew/brew/opt/llvm/lib/clang/22/lib/darwin -Wl,-rpath,/Users/mathomp4/.homebrew/brew/Cellar/flang/22.1.8/lib -Wl,-rpath,/Users/mathomp4/ESMF_Testing/llvm_22.1_mpiuni_g_feature_darwin-work/esmf/lib/libg/Darwin.llvm.64.mpiuni.default -Wl,-rpath,opt/libomp/lib -Wl,-rpath,/Users/mathomp4/.homebrew/brew/opt/llvm/lib/clang/22/lib/darwin -Wl,-rpath,/Users/mathomp4/.homebrew/brew/Cellar/flang/22.1.8/lib
ESMF_CESMFLINKRPATHS=-Wl,-rpath,/Users/mathomp4/ESMF_Testing/llvm_22.1_mpiuni_g_feature_darwin-work/esmf/lib/libg/Darwin.llvm.64.mpiuni.default
ESMF_CLINKLIBS= -lflang_rt.runtime -lSystem  -lc++
ESMF_CESMFLINKLIBS=-lesmf  -lflang_rt.runtime -lSystem  -lc++

ESMF_SO_F90COMPILEOPTS=-fPIC
ESMF_SO_F90LINKOPTS=-dynamiclib
ESMF_SO_F90LINKOPTSEXE=
ESMF_SO_CXXCOMPILEOPTS=-fPIC
ESMF_SO_CXXLINKOPTS=-dynamiclib
ESMF_SO_CXXLINKOPTSEXE=
ESMF_SO_CCOMPILEOPTS=-fPIC
ESMF_SO_CLINKOPTS=-dynamiclib
ESMF_SO_CLINKOPTSEXE=

ESMF_SL_SUFFIX=dylib

ESMF_OPENMP_F90COMPILEOPTS= -fopenmp
ESMF_OPENMP_F90LINKOPTS= -fopenmp
ESMF_OPENMP_CXXCOMPILEOPTS= -Xpreprocessor -fopenmp
ESMF_OPENMP_CXXLINKOPTS= -Xpreprocessor -fopenmp

ESMF_OPENACC_F90COMPILEOPTS= -fopenacc
ESMF_OPENACC_F90LINKOPTS= -fopenacc
ESMF_OPENACC_CXXCOMPILEOPTS=
ESMF_OPENACC_CXXLINKOPTS=

# ESMF Tracing compile/link options
ESMF_TRACE_LDPRELOAD=/Users/mathomp4/ESMF_Testing/llvm_22.1_mpiuni_g_feature_darwin-work/esmf/lib/libg/Darwin.llvm.64.mpiuni.default/libesmftrace_preload.dylib
ESMF_TRACE_STATICLINKOPTS=-static -Wl,--wrap=c_esmftrace_notify_wrappers -Wl,--wrap=c_esmftrace_isinitialized -Wl,--wrap=write -Wl,--wrap=writev -Wl,--wrap=pwrite -Wl,--wrap=read -Wl,--wrap=open -Wl,--wrap=MPI_Allgather -Wl,--wrap=MPI_Allgatherv -Wl,--wrap=MPI_Allreduce -Wl,--wrap=MPI_Alltoall -Wl,--wrap=MPI_Alltoallv -Wl,--wrap=MPI_Alltoallw -Wl,--wrap=MPI_Barrier -Wl,--wrap=MPI_Bcast -Wl,--wrap=MPI_Bsend -Wl,--wrap=MPI_Gather -Wl,--wrap=MPI_Gatherv -Wl,--wrap=MPI_Iprobe -Wl,--wrap=MPI_Irecv -Wl,--wrap=MPI_Irsend -Wl,--wrap=MPI_Isend -Wl,--wrap=MPI_Issend -Wl,--wrap=MPI_Probe -Wl,--wrap=MPI_Recv -Wl,--wrap=MPI_Reduce -Wl,--wrap=MPI_Rsend -Wl,--wrap=MPI_Scan -Wl,--wrap=MPI_Scatter -Wl,--wrap=MPI_Scatterv -Wl,--wrap=MPI_Send -Wl,--wrap=MPI_Sendrecv -Wl,--wrap=MPI_Test -Wl,--wrap=MPI_Testall -Wl,--wrap=MPI_Testany -Wl,--wrap=MPI_Testsome -Wl,--wrap=MPI_Wait -Wl,--wrap=MPI_Waitall -Wl,--wrap=MPI_Waitany -Wl,--wrap=MPI_Waitsome -Wl,--wrap=mpi_allgather_ -Wl,--wrap=mpi_allgather__ -Wl,--wrap=mpi_allgatherv_ -Wl,--wrap=mpi_allgatherv__ -Wl,--wrap=mpi_allreduce_ -Wl,--wrap=mpi_allreduce__ -Wl,--wrap=mpi_alltoall_ -Wl,--wrap=mpi_alltoall__ -Wl,--wrap=mpi_alltoallv_ -Wl,--wrap=mpi_alltoallv__ -Wl,--wrap=mpi_alltoallw_ -Wl,--wrap=mpi_alltoallw__ -Wl,--wrap=mpi_barrier_ -Wl,--wrap=mpi_barrier__ -Wl,--wrap=mpi_bcast_ -Wl,--wrap=mpi_bcast__ -Wl,--wrap=mpi_bsend_ -Wl,--wrap=mpi_bsend__ -Wl,--wrap=mpi_exscan_ -Wl,--wrap=mpi_exscan__ -Wl,--wrap=mpi_gather_ -Wl,--wrap=mpi_gather__ -Wl,--wrap=mpi_gatherv_ -Wl,--wrap=mpi_gatherv__ -Wl,--wrap=mpi_iprobe_ -Wl,--wrap=mpi_iprobe__ -Wl,--wrap=mpi_irecv_ -Wl,--wrap=mpi_irecv__ -Wl,--wrap=mpi_irsend_ -Wl,--wrap=mpi_irsend__ -Wl,--wrap=mpi_isend_ -Wl,--wrap=mpi_isend__ -Wl,--wrap=mpi_issend_ -Wl,--wrap=mpi_issend__ -Wl,--wrap=mpi_probe_ -Wl,--wrap=mpi_probe__ -Wl,--wrap=mpi_recv_ -Wl,--wrap=mpi_recv__ -Wl,--wrap=mpi_reduce_ -Wl,--wrap=mpi_reduce__ -Wl,--wrap=mpi_reduce_scatter_ -Wl,--wrap=mpi_reduce_scatter__ -Wl,--wrap=mpi_rsend_ -Wl,--wrap=mpi_rsend__ -Wl,--wrap=mpi_scatter_ -Wl,--wrap=mpi_scatter__ -Wl,--wrap=mpi_scatterv_ -Wl,--wrap=mpi_scatterv__ -Wl,--wrap=mpi_scan_ -Wl,--wrap=mpi_scan__ -Wl,--wrap=mpi_send_ -Wl,--wrap=mpi_send__ -Wl,--wrap=mpi_sendrecv_ -Wl,--wrap=mpi_sendrecv__ -Wl,--wrap=mpi_test_ -Wl,--wrap=mpi_test__ -Wl,--wrap=mpi_testall_ -Wl,--wrap=mpi_testall__ -Wl,--wrap=mpi_testany_ -Wl,--wrap=mpi_testany__ -Wl,--wrap=mpi_testsome_ -Wl,--wrap=mpi_testsome__ -Wl,--wrap=mpi_wait_ -Wl,--wrap=mpi_wait__ -Wl,--wrap=mpi_waitall_ -Wl,--wrap=mpi_waitall__ -Wl,--wrap=mpi_waitany_ -Wl,--wrap=mpi_waitany__
ESMF_TRACE_STATICLINKLIBS=-lesmftrace_static
ESMF_TRACE_DYNAMICLINKLIBS=-lesmftrace_preload
ESMF_F90ESMFPRELOADLINKLIBS=-lesmf -lesmftrace_preload  -lc++

# Internal ESMF variables, do NOT depend on these!

ESMF_INTERNAL_DIR=/Users/mathomp4/ESMF_Testing/llvm_22.1_mpiuni_g_feature_darwin-work/esmf
ESMF_INTERNAL_MPIRUN="/Users/mathomp4/ESMF_Testing/llvm_22.1_mpiuni_g_feature_darwin-work/esmf/src/Infrastructure/stubs/mpiuni/mpirun"

#
# !!! The following options were used on this ESMF build !!!
#
# ESMF_DIR: /Users/mathomp4/ESMF_Testing/llvm_22.1_mpiuni_g_feature_darwin-work/esmf
# ESMF_OS: Darwin
# ESMF_MACHINE: arm64
# ESMF_ABI: 64
# ESMF_COMPILER: llvm
# ESMF_BOPT: g
# ESMF_COMM: mpiuni
# ESMF_SITE: default
# ESMF_PTHREADS: ON
# ESMF_OPENMP: OFF
# ESMF_OPENACC: OFF
# ESMF_ARRAY_LITE: FALSE
# ESMF_NO_INTEGER_1_BYTE: TRUE
# ESMF_NO_INTEGER_2_BYTE: TRUE
# ESMF_FORTRANSYMBOLS: default
# ESMF_MAPPER_BUILD: OFF
# ESMF_AUTO_LIB_BUILD: ON
# ESMF_DEFER_LIB_BUILD: ON
# ESMF_SHARED_LIB_BUILD: ON
# 
# ESMF environment variables pointing to 3rd party software:
# ESMF_MOAB:              internal
# ESMF_LAPACK:            internal
# ESMF_ACC_SOFTWARE_STACK:            none
# ESMF_YAMLCPP:           internal
#
# * Compilers, Linkers, Flags, and Libraries *
# Location of the preprocessor:      /usr/bin/clang
# Location of the Fortran compiler:  /Users/mathomp4/.homebrew/brew/bin/flang
# Location of the Fortran linker:    /Users/mathomp4/.homebrew/brew/bin/flang
# Location of the C++ compiler:      /usr/bin/clang++
# Location of the C++ linker:        /usr/bin/clang++
# Location of the C compiler:        /usr/bin/clang
# Location of the C linker:          /usr/bin/clang
#
