.include "cpctelera.h.s"
.area _DATA
.area _CODE

.globl cpct_memcpy_asm
.globl cpct_disableFirmware_asm
.globl cpct_setVideoMode_asm
.globl cpct_setPALColour_asm
.globl cpct_getRandom_mxor_u8_asm
.globl cpct_waitVSYNC_asm

.globl manEntityInit
.globl manEntityCreate

.globl sysPhysicsUpdate
.globl sysRenderUpdate
.globl sysGeneratorUpdate


esperar:
   ld a, #3
   esperarbucle:
   push af
   halt
   halt
   call cpct_waitVSYNC_asm
   pop af
   dec a
   jr nz, esperarbucle
ret

_main::
   call cpct_disableFirmware_asm
      ld c, #0
   call cpct_setVideoMode_asm

   cpctm_setBorder_asm HW_BLACK

   ld l, #0
   ld h, #HW_BLACK
   call cpct_setPALColour_asm
   

   call manEntityInit ;; Iniciamos todos los valores del array a 0

mainLoop:
   call sysPhysicsUpdate
   call sysGeneratorUpdate
   call sysRenderUpdate
   
   call esperar


loop:
   jr    mainLoop