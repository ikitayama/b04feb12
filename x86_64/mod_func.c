#include <stdio.h>
#include "hocdec.h"
extern int nrnmpi_myid;
extern int nrn_nobanner_;

extern void _cal_reg(void);
extern void _kcRT03_reg(void);
extern void _kdr_reg(void);
extern void _matrix_reg(void);
extern void _nafPR_reg(void);
extern void _passiv_reg(void);
extern void _rcadecay_reg(void);
extern void _rkq_reg(void);
extern void _vecst_reg(void);

void modl_reg(){
  if (!nrn_nobanner_) if (nrnmpi_myid < 1) {
    fprintf(stderr, "Additional mechanisms from files\n");

    fprintf(stderr," cal.mod");
    fprintf(stderr," kcRT03.mod");
    fprintf(stderr," kdr.mod");
    fprintf(stderr," matrix.mod");
    fprintf(stderr," nafPR.mod");
    fprintf(stderr," passiv.mod");
    fprintf(stderr," rcadecay.mod");
    fprintf(stderr," rkq.mod");
    fprintf(stderr," vecst.mod");
    fprintf(stderr, "\n");
  }
  _cal_reg();
  _kcRT03_reg();
  _kdr_reg();
  _matrix_reg();
  _nafPR_reg();
  _passiv_reg();
  _rcadecay_reg();
  _rkq_reg();
  _vecst_reg();
}
