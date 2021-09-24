
.include "cpctelera.h.s"

.area _DATA

.area _CODE


.globl cpct_disableFirmware_asm
.globl cpct_getScreenPtr_asm
.globl cpct_setDrawCharM1_asm
.globl cpct_drawStringM1_asm


_main::
   call manEntityInit
   call manEntityCreate



   ;; Loop forever
loop:
   jr    loop