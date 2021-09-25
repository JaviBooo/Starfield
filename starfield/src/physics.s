eTypeInvalid=0x00
eTypeStar=0x01
eTypeDead=0x80
eTypeDefault=0x7f

.globl manEntityDestroy

sysPhysicsUpdateOne:

    inc hl
    ld b, (hl) ;; x

    inc hl 
    inc hl  
    ld a, (hl) ;; vx

    dec hl
    dec hl
    dec hl

    add a, b
    cp b

    jr z, amayorqueb

    inc hl
    ld (hl), a
    dec hl
    jr finSysPhysicsUpdateOne

amayorqueb:
    call manEntityDestroy
    
finSysPhysicsUpdateOne:
    ret

sysPhysicsUpdate::

        ld a, (hl)      ;; tipo de la entidad
        or a

        jr z, salir

        call sysPhysicsUpdateOne

        ld a, #5
        add a, l
        ld l, a

    jr sysPhysicsUpdate

salir:
    ret