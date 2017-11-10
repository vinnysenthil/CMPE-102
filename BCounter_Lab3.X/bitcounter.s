; San Jose State University
; College of Engineering
; Computer Engineering Department
; CMPE102 - Assembly Language Programming
; 
; *************************************************************
; bitcounter.s Lab 3
; *************************************************************
; 
;
; Variable Declarations
;=====================
.bss

u8_i:    .space 1   ; Iterative counter
u8_j:    .space 1   ; Testing value (0xE2)
u8_k:	 .space 1   ; Bit counter

; Assembly Code
; =============
.text
.global __reset
__reset:

  ; Initialize given values
  
  mov.b #0xE2, W0
  mov.b WREG, u8_j
  
  mov.b #0x00, W0
  mov.b WREG, u8_k
  mov.b WREG, u8_i
  
  start_loop:
    mov.b u8_i, WREG
    cp.b W0, #0x8
    bra Z, end_loop
    mov.b u8_j, WREG
    and.b #0x1, W0
    bra NZ, increment
    lsr.b u8_j
  continue:
    inc.b u8_i
    bra start_loop
  increment:
    inc.b u8_k
    lsr.b u8_j
    bra continue
    
  end_loop:
  
done:
  goto     done    ; Place holder for last line of executed code