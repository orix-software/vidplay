
.include "telestrat.inc"
; ----------------------------------------------------------------------------

.export _play



.proc _play

read:
  
  lda #<format
  sta PTR_READ_DEST
  lda #>format
  sta PTR_READ_DEST+1	

  lda #$08 ; Load the 8 first bytes : the movie type, and the length of each frames

  ldy #$00
  BRK_TELEMON(XFREAD)

loopme:
  lda #<$a000
  sta PTR_READ_DEST
  lda #>$a000
  sta PTR_READ_DEST+1	

  lda sizeframe ; read a frame (6KB)

  ldy sizeframe+1
  BRK_TELEMON(XFREAD)

next:
  jmp loopme ; never end but loop all the file
end:
  rts
.endproc

  
format:
  .res 3 ; VHI pattern
  .res 1 ; Type : 0 raw
number_of_frames:
  .res 2
sizeframe:
  .res 2,0

  



