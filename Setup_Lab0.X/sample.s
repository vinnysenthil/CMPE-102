; San Jose State University
; College of Engineering
; Computer Engineering Department
; CMPE102 - Assembly Language Programming
; 
; *************************************************************
; sample.s - First assembly program
; *************************************************************
; 
;
; Variable Declarations
;=====================
.bss
; Reserve one word (16 bits) for each variable with ``.space`` directive.
id0:   .space 2
id1:   .space 2
id2:   .space 2
id3:   .space 2

; Assembly Code
; =============
.text
.global __reset
__reset:

  ;; Initialize with student ID values
  mov #0x0100, W0
  mov W0, id3
  mov #0x0302, W0
  mov W0, id2
  mov #0x0504, W0
  mov W0, id1
  mov #0x0706, W1
  mov W1, id0
  

done:
  goto     done    ;Place holder for last line of executed code
