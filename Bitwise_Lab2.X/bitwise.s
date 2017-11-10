; San Jose State University
; College of Engineering
; Computer Engineering Department
; CMPE102 - Assembly Language Programming
; 
; *************************************************************
; bitwise.s Lab 2 - Logical Bitwise Functions
; *************************************************************
; 
;
; Variable Declarations
;=====================
.bss

result1:    .space 2
result2:    .space 2

; Assembly Code
; =============
.text
.global __reset
__reset:

  ; Initialize given values
  
  mov #0xAB90, W0
  mov WREG, 0x1000
  mov #0x12CD, W0
  mov WREG, 0x1002
 
  mov.b 0x1002, WREG
  mov.b WREG, 0x1010
  mov.b 0x1001, WREG
  mov.b WREG, 0x1011
  
  mov 0x1010, W1
  mov W1, result1
  
  mov W1, 0x1012
    
  btg 0x1012, #1
  btg 0x1012, #3
  btg 0x1012, #5
  btg 0x1012, #7
  btg 0x1012, #9
  btg 0x1012, #11
  btg 0x1012, #13
  btg 0x1012, #15
  
  mov 0x1012, W1
  mov W1, result2
  
done:
  goto     done    ;Place holder for last line of executed code
