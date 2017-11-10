; San Jose State University
; College of Engineering
; Computer Engineering Department
; CMPE102 - Assembly Language Programming
; 
; *************************************************************
; array_addition.s Lab 1 - Array Addition
; *************************************************************
; 
;
; Variable Declarations
;=====================
.bss
; no variable declations

; Assembly Code
; =============
.text
.global __reset
__reset:

  ; Initialize Matrix A
  
  mov.b #2, W0
  mov.b WREG, 0x1000
  mov.b #14, W0
  mov.b WREG, 0x1001
  mov.b #26, W0
  mov.b WREG, 0x1002
  mov.b #38, W0
  mov.b WREG, 0x1003
  
  ; Initialize Matrix B
  
  mov.b #1, W0
  mov.b WREG, 0x1061
  mov.b #13, W0
  mov.b WREG, 0x1062
  mov.b #25, W0
  mov.b WREG, 0x1063
  mov.b #37, W0
  mov.b WREG, 0x1064
  
  ; Initialize Matrix C
  mov.b #0, W0
  mov.b WREG, 0x1300
  mov.b WREG, 0x1301
  mov.b WREG, 0x1302
  mov.b WREG, 0x1303
  
  ; Outputting A+B into C
  
  mov.b 0x1000, WREG
  add.b 0x1061, WREG
  mov.b WREG, 0x1300
  
  mov.b 0x1001, WREG
  add.b 0x1062, WREG
  mov.b WREG, 0x1301
  
  mov.b 0x1002, WREG
  add.b 0x1063, WREG
  mov.b WREG, 0x1302
  
  mov.b 0x1003, WREG
  add.b 0x1064, WREG
  mov.b WREG, 0x1303
  
done:
  goto     done    ;Place holder for last line of executed code
