
.globl cpct_memset_asm
.globl cpct_memcpy_asm

posicionActual:
.ds 2

eTypeInvalid=0x00
eTypeStar=0x01
eTypeDead=0x80
eTypeDefault=0x7f

mEntities:
   .ds 50 ;;0->type, 1->x, 2->y, 3->vx , 4->color 

mNextFreeEntity:
   .ds 2


manEntityInit::

   ld bc, #50 ;; size

   ld a, #0 ;; value

   ld de, #mEntities ;; puntero al array, primer valor

   call cpct_memset_asm

   ld hl, #mEntities
   ld (mNextFreeEntity), hl
   ret

manEntityCreate::
   ld bc, (mNextFreeEntity) 

   ld a, #eTypeDefault
   ld (bc), a

   ld hl, #0x0005
   add hl, bc
   ld (mNextFreeEntity), hl 
   ld l, c
   ld h, b
   ret

manEntityDestroy::

   ld (posicionActual), hl

   ld bc, #0xfffb
   ld d, h
   ld e, l
   ld hl, (#mNextFreeEntity)

   add hl, bc

   ld (mNextFreeEntity), hl

   ld bc, #5

   call cpct_memcpy_asm

   ld bc, #5 ;; size

   ld a, #0 ;; value

   ld de, (#mNextFreeEntity) ;; puntero al array, primer valor

   call cpct_memset_asm

   ld hl, (#posicionActual)

   ret

getEntities::
   ld hl, #mEntities
   ret