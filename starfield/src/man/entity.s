mEntities:
   .ds 50 ;;0->type, 1->x, 2->y, 3->vx , 4->color 

mNextFreeEntity:
   .ds 2


manEntityInit::

    ld bc, #50 ;; size

    ld a, 0 ;; value

    ld de, #mEntities ;; puntero al array, primer valor

    call cpct_memset_asm

    ld hl, #mEntities
    ld (mNextFreeEntity), hl
    ret

manEntityCreate::
    ld bc, (mNextFreeEntity) 
    ld hl, #0x0005
    add hl, bc
    ld (mNextFreeEntity), hl 
    ld l, c
    ld h, b
    ret