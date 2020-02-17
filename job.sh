#!/bin/sh
#PJM -L "vnode=1"
#PJM -L "elapse=00:10:00"
#PJM -L "ru=ito-b"
#PJM -L "rg=ito-g-1-dbg"
##PJM -L "rg=ito-g-16-dbg"

#PJM -X 
#PJM -S

module load openmpi/3.1.3-nocuda-gcc4.8.5
#module load intel
#module load openmpi

#export NEST_DATA_DIR=$HOME/opt/nest-gcc/share/nest
#export NEST_INSTALL_DIR=$HOME/opt/nest-gcc
#export LD_LIBRARY_PATH=$HOME/opt/nest-gcc/lib64:$LD_LIBRARY_PATH
NUM_NODES=$PJM_VNODES
NUM_CORES=$((9))
#NUM_PROCS=16
#NUM_THREADS=36

#export I_MPI_PERHOST=`expr $NUM_CORES / $NUM_THREADS`
#export I_MPI_FABRICS=shm:ofi
#export I_MPI_PIN_DOMAIN=omp
#export I_MPI_PIN_CELL=core

export OMP_NUM_THREADS=$NUM_THREADS
export KMP_STACKSIZE=8m
export KMP_AFFINITY=compact

#export I_MPI_HYDRA_BOOTSTRAP=rsh
#export I_MPI_HYDRA_BOOTSTRAP_EXEC=/bin/pjrsh
#export I_MPI_HYDRA_HOST_FILE=${PJM_O_NODEINF}

#mpiexec -n 1 ${NEST_INSTALL_DIR}/bin//nest hpc_benchmark.sli
mpirun --np 4 ~/opt/nrn-master/x86_64/bin/nrniv batch_a.hoc 

