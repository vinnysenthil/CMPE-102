; San Jose State University
; College of Engineering
; Computer Engineering Department
; CMPE102 - Assembly Language Programming
; 
; *************************************************************
; 32sort.s Lab 4
; *************************************************************
; 
;
; Variable Declarations
;=====================
.bss

memadd:    .space 2   ; Iterative counter
lowerval:  .space 4   ; Check LSW
upperval:  .space 4   ; Check MSW

; Assembly Code
; =============
.text
.global __reset
__reset:

  ; Initialize given values
  
  mov #0x8000, W2
  mov #0x0008, W3
  mov #0x1000, W4
  mov.d W2, [W4]
  mov #0x1028, W4
  mov.d W2, [W4]
  
  mov #0x5000, W2
  mov #0x0005, W3
  mov #0x1004, W4
  mov.d W2, [W4]
  
  mov #0x1000, W2
  mov #0x0001, W3
  mov #0x1008, W4
  mov.d W2, [W4]
  
  mov #0x4000, W2
  mov #0x0004, W3
  mov #0x100C, W4
  mov.d W2, [W4]
  
  mov #0xA000, W2
  mov #0x000A, W3
  mov #0x1010, W4
  mov.d W2, [W4]
  
  mov #0xC000, W2
  mov #0x000C, W3
  mov #0x1014, W4
  mov.d W2, [W4]
  
  mov #0x9000, W2
  mov #0x0009, W3
  mov #0x1018, W4
  mov.d W2, [W4]
  
  clr W2
  clr W3
  mov #0x101C, W4
  mov.d W2, [W4]
  
  mov #0xE000, W2
  mov #0x000E, W3
  mov #0x1020, W4
  mov.d W2, [W4]
  
  mov #0x3000, W2
  mov #0x000E, W3
  mov #0x1024, W4
  mov.d W2, [W4]
  
  mov #0x2000, W2
  mov #0x0002, W3
  mov #0x102C, W4
  mov.d W2, [W4]
  
  mov #0x1000, W2   ; Starting Address to Search
  mov #0x102C, W15  ; Final Address to Search
  mov #0x0000, W14  ; Swap Flag (set to 0 incase list is already sorted)
  
bubble_check:	    ; Inner loop of bubble sort
  mov.d [W2], W4    ; Set the next two double words into W4 and W6
  add #0x0004, W2
  mov.d [W2], W6
  
  cp W5, W7
  cpb W4, W6	    ; Check if left element is greater than right, if so: swap
  bra GTU, bubble_swap
  
continue:
  cp W2, W15	    ; Checking iterator to see if we've reached end of loop
  bra Z, bubble_loop; If so, go to outer loop
  bra bubble_check  ; Otherwise continue on
    
bubble_swap:	    ; Swap two elements
  mov #0x0001, W14  ; Set Swap Flag (swap has occured, thus list is not sorted)
  mov.d W4, [W2]    ; Swap left element into right
  sub #0x0004, W2
  mov.d W6, [W2]    ; Swap right element into left
  add #0x0004, W2
  bra continue	    ; Return back into iteration

bubble_loop:	    ; Outer Loop of Bubble Sort
  cp W14, #0x0000
  bra Z, done	    ; Check if any swaps were done this walkthrough
		    ; If swaps were done, continue on:
		    
  mov #0x0000, W14  ; Reset Flag
  mov #0x1000, W2   ; Reset Start Address
  bra bubble_check  ; Enter inner loop

done:
  goto     done    ; Place holder for last line of executed code