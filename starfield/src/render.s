.globl cpct_getScreenPtr_asm

sysRenderUpdateOne:
    
    ld de, #0xc000

    inc hl
    ld c, (hl)

    inc hl
    ld b, (hl)

    inc hl
    inc hl
    ld a, (hl)

    push hl
    push af

    call cpct_getScreenPtr_asm

    pop af
    
    ld (hl), a

    pop hl

    dec hl
    dec hl
    dec hl
    dec hl

ret

sysRenderUpdate::

        ld a, (hl)      ;; tipo de la entidad
        or a

        jr z, salir1

        call sysRenderUpdateOne

        ld bc, #5
        add hl, bc

    jr sysRenderUpdate

salir1:
    ret
