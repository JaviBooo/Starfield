.include "cpctelera.h.s"
.area _DATA
.area _CODE



.globl cpct_memcpy_asm
.globl cpct_disableFirmware_asm
.globl cpct_setVideoMode_asm
.globl cpct_setPALColour_asm

.globl manEntityInit
.globl manEntityCreate
.globl getEntities

.globl sysPhysicsUpdate

.globl sysRenderUpdate


initE: ;; entity constante para copias
.db #1      ;; type
.db #79     ;; x
.db #1      ;; y  
.db #-1     ;; vx
.db #0xff  ;; color


createEntity:

   call manEntityCreate

   ld d, h
   ld e, l

   ld hl, #initE

   ld bc, #5
   
   call cpct_memcpy_asm
   ret

esperar:
   ld a, #30
   esperarbucle:
   halt
   dec a
   jr nz, esperarbucle
ret

_main::
   call cpct_disableFirmware_asm
      ld c, #0
   call cpct_setVideoMode_asm

   ;;Macro del borde?????????????????????


   ld l, #0
   ld h, #20
   call cpct_setPALColour_asm
   

   call manEntityInit ;; Iniciamos todos los valores del array a 0

   ld a, #5 ;; Cantidad de entidades a crear
crearBucle:
   push af
   call createEntity
   pop af
   dec a
   jr nz, crearBucle

mainLoop:
   call getEntities
   call sysPhysicsUpdate

   call getEntities
   call sysRenderUpdate
   call esperar


loop:
   jr    mainLoop