
_blink_parameter:

;finale_VF.c,5 :: 		void blink_parameter() {
;finale_VF.c,6 :: 		unsigned char j = 0;
	CLRF       blink_parameter_j_L0+0
;finale_VF.c,7 :: 		while(j < 30) {
L_blink_parameter0:
	MOVLW      30
	SUBWF      blink_parameter_j_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_blink_parameter1
;finale_VF.c,8 :: 		j++;
	INCF       blink_parameter_j_L0+0, 1
;finale_VF.c,9 :: 		delay_ms(30);
	MOVLW      39
	MOVWF      R12+0
	MOVLW      245
	MOVWF      R13+0
L_blink_parameter2:
	DECFSZ     R13+0, 1
	GOTO       L_blink_parameter2
	DECFSZ     R12+0, 1
	GOTO       L_blink_parameter2
;finale_VF.c,10 :: 		}
	GOTO       L_blink_parameter0
L_blink_parameter1:
;finale_VF.c,11 :: 		}
L_end_blink_parameter:
	RETURN
; end of _blink_parameter

_display_7seg_1Digit:

;finale_VF.c,13 :: 		void display_7seg_1Digit(unsigned char x){
;finale_VF.c,14 :: 		PORTB = x;
	MOVF       FARG_display_7seg_1Digit_x+0, 0
	MOVWF      PORTB+0
;finale_VF.c,15 :: 		PORTA = 0x08 ;
	MOVLW      8
	MOVWF      PORTA+0
;finale_VF.c,16 :: 		}
L_end_display_7seg_1Digit:
	RETURN
; end of _display_7seg_1Digit

_display_7seg_2Digit_D:

;finale_VF.c,18 :: 		void display_7seg_2Digit_D(unsigned char x){
;finale_VF.c,20 :: 		d = x/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_display_7seg_2Digit_D_x+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      display_7seg_2Digit_D_d_L0+0
;finale_VF.c,21 :: 		u = x%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_display_7seg_2Digit_D_x+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
;finale_VF.c,22 :: 		PORTA = 0x08;
	MOVLW      8
	MOVWF      PORTA+0
;finale_VF.c,23 :: 		PORTB = u;
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;finale_VF.c,24 :: 		delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_display_7seg_2Digit_D3:
	DECFSZ     R13+0, 1
	GOTO       L_display_7seg_2Digit_D3
	DECFSZ     R12+0, 1
	GOTO       L_display_7seg_2Digit_D3
;finale_VF.c,25 :: 		PORTA = 0x04;
	MOVLW      4
	MOVWF      PORTA+0
;finale_VF.c,26 :: 		PORTB = d;
	MOVF       display_7seg_2Digit_D_d_L0+0, 0
	MOVWF      PORTB+0
;finale_VF.c,27 :: 		delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_display_7seg_2Digit_D4:
	DECFSZ     R13+0, 1
	GOTO       L_display_7seg_2Digit_D4
	DECFSZ     R12+0, 1
	GOTO       L_display_7seg_2Digit_D4
;finale_VF.c,28 :: 		}
L_end_display_7seg_2Digit_D:
	RETURN
; end of _display_7seg_2Digit_D

_display_7seg_2Digit_G:

;finale_VF.c,30 :: 		void display_7seg_2Digit_G(unsigned char x){
;finale_VF.c,32 :: 		d = x/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_display_7seg_2Digit_G_x+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      display_7seg_2Digit_G_d_L0+0
;finale_VF.c,33 :: 		u = x%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_display_7seg_2Digit_G_x+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
;finale_VF.c,34 :: 		PORTA = 0x02;
	MOVLW      2
	MOVWF      PORTA+0
;finale_VF.c,35 :: 		PORTB = u;
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;finale_VF.c,36 :: 		delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_display_7seg_2Digit_G5:
	DECFSZ     R13+0, 1
	GOTO       L_display_7seg_2Digit_G5
	DECFSZ     R12+0, 1
	GOTO       L_display_7seg_2Digit_G5
;finale_VF.c,37 :: 		PORTA = 0x01;
	MOVLW      1
	MOVWF      PORTA+0
;finale_VF.c,38 :: 		PORTB = d;
	MOVF       display_7seg_2Digit_G_d_L0+0, 0
	MOVWF      PORTB+0
;finale_VF.c,39 :: 		delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_display_7seg_2Digit_G6:
	DECFSZ     R13+0, 1
	GOTO       L_display_7seg_2Digit_G6
	DECFSZ     R12+0, 1
	GOTO       L_display_7seg_2Digit_G6
;finale_VF.c,40 :: 		}
L_end_display_7seg_2Digit_G:
	RETURN
; end of _display_7seg_2Digit_G

_horloge:

;finale_VF.c,42 :: 		void horloge(void){
;finale_VF.c,43 :: 		display_7seg_2Digit_D(secondes);
	MOVF       _secondes+0, 0
	MOVWF      FARG_display_7seg_2Digit_D_x+0
	CALL       _display_7seg_2Digit_D+0
;finale_VF.c,44 :: 		display_7seg_2Digit_G(minut);
	MOVF       _minut+0, 0
	MOVWF      FARG_display_7seg_2Digit_G_x+0
	CALL       _display_7seg_2Digit_G+0
;finale_VF.c,46 :: 		if(secondes>=60){
	MOVLW      60
	SUBWF      _secondes+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_horloge7
;finale_VF.c,47 :: 		minut++;
	INCF       _minut+0, 1
;finale_VF.c,48 :: 		secondes=0;
	CLRF       _secondes+0
;finale_VF.c,49 :: 		}
L_horloge7:
;finale_VF.c,50 :: 		if(minut>59){
	MOVF       _minut+0, 0
	SUBLW      59
	BTFSC      STATUS+0, 0
	GOTO       L_horloge8
;finale_VF.c,51 :: 		minut=0;
	CLRF       _minut+0
;finale_VF.c,52 :: 		secondes=0;
	CLRF       _secondes+0
;finale_VF.c,53 :: 		}
L_horloge8:
;finale_VF.c,54 :: 		}
L_end_horloge:
	RETURN
; end of _horloge

_reglage:

;finale_VF.c,56 :: 		void reglage(void){
;finale_VF.c,57 :: 		unsigned char secondes1 = secondes;
	MOVF       _secondes+0, 0
	MOVWF      reglage_secondes1_L0+0
;finale_VF.c,58 :: 		unsigned char minut1 = minut;
	MOVF       _minut+0, 0
	MOVWF      reglage_minut1_L0+0
;finale_VF.c,59 :: 		delay_ms(250);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_reglage9:
	DECFSZ     R13+0, 1
	GOTO       L_reglage9
	DECFSZ     R12+0, 1
	GOTO       L_reglage9
	DECFSZ     R11+0, 1
	GOTO       L_reglage9
	NOP
	NOP
;finale_VF.c,60 :: 		while(PORTB.B7 == 1){
L_reglage10:
	BTFSS      PORTB+0, 7
	GOTO       L_reglage11
;finale_VF.c,61 :: 		display_7seg_2Digit_D(secondes1);
	MOVF       reglage_secondes1_L0+0, 0
	MOVWF      FARG_display_7seg_2Digit_D_x+0
	CALL       _display_7seg_2Digit_D+0
;finale_VF.c,62 :: 		blink_parameter();
	CALL       _blink_parameter+0
;finale_VF.c,63 :: 		if(PORTB.B5 == 0){
	BTFSC      PORTB+0, 5
	GOTO       L_reglage12
;finale_VF.c,64 :: 		delay_ms(250);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_reglage13:
	DECFSZ     R13+0, 1
	GOTO       L_reglage13
	DECFSZ     R12+0, 1
	GOTO       L_reglage13
	DECFSZ     R11+0, 1
	GOTO       L_reglage13
	NOP
	NOP
;finale_VF.c,65 :: 		secondes1++;
	INCF       reglage_secondes1_L0+0, 1
;finale_VF.c,66 :: 		}
L_reglage12:
;finale_VF.c,67 :: 		if(secondes1 >= 60){
	MOVLW      60
	SUBWF      reglage_secondes1_L0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_reglage14
;finale_VF.c,68 :: 		secondes1 = 0;
	CLRF       reglage_secondes1_L0+0
;finale_VF.c,69 :: 		}
L_reglage14:
;finale_VF.c,70 :: 		}
	GOTO       L_reglage10
L_reglage11:
;finale_VF.c,71 :: 		delay_ms(250);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_reglage15:
	DECFSZ     R13+0, 1
	GOTO       L_reglage15
	DECFSZ     R12+0, 1
	GOTO       L_reglage15
	DECFSZ     R11+0, 1
	GOTO       L_reglage15
	NOP
	NOP
;finale_VF.c,72 :: 		while(PORTB.B7 == 1){
L_reglage16:
	BTFSS      PORTB+0, 7
	GOTO       L_reglage17
;finale_VF.c,73 :: 		display_7seg_2Digit_G(minut1);
	MOVF       reglage_minut1_L0+0, 0
	MOVWF      FARG_display_7seg_2Digit_G_x+0
	CALL       _display_7seg_2Digit_G+0
;finale_VF.c,74 :: 		blink_parameter();
	CALL       _blink_parameter+0
;finale_VF.c,75 :: 		if(PORTB.B5==0){
	BTFSC      PORTB+0, 5
	GOTO       L_reglage18
;finale_VF.c,76 :: 		delay_ms(250);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_reglage19:
	DECFSZ     R13+0, 1
	GOTO       L_reglage19
	DECFSZ     R12+0, 1
	GOTO       L_reglage19
	DECFSZ     R11+0, 1
	GOTO       L_reglage19
	NOP
	NOP
;finale_VF.c,77 :: 		minut1++;
	INCF       reglage_minut1_L0+0, 1
;finale_VF.c,78 :: 		}
L_reglage18:
;finale_VF.c,79 :: 		if(minut1 >= 60){
	MOVLW      60
	SUBWF      reglage_minut1_L0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_reglage20
;finale_VF.c,80 :: 		minut1=0;
	CLRF       reglage_minut1_L0+0
;finale_VF.c,81 :: 		}
L_reglage20:
;finale_VF.c,82 :: 		}
	GOTO       L_reglage16
L_reglage17:
;finale_VF.c,83 :: 		delay_ms(250);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_reglage21:
	DECFSZ     R13+0, 1
	GOTO       L_reglage21
	DECFSZ     R12+0, 1
	GOTO       L_reglage21
	DECFSZ     R11+0, 1
	GOTO       L_reglage21
	NOP
	NOP
;finale_VF.c,84 :: 		secondes = secondes1;
	MOVF       reglage_secondes1_L0+0, 0
	MOVWF      _secondes+0
;finale_VF.c,85 :: 		minut = minut1;
	MOVF       reglage_minut1_L0+0, 0
	MOVWF      _minut+0
;finale_VF.c,86 :: 		}
L_end_reglage:
	RETURN
; end of _reglage

_chronometre:

;finale_VF.c,88 :: 		void chronometre(){
;finale_VF.c,89 :: 		delay_ms(250);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_chronometre22:
	DECFSZ     R13+0, 1
	GOTO       L_chronometre22
	DECFSZ     R12+0, 1
	GOTO       L_chronometre22
	DECFSZ     R11+0, 1
	GOTO       L_chronometre22
	NOP
	NOP
;finale_VF.c,90 :: 		Cg = 00;
	CLRF       _Cg+0
;finale_VF.c,91 :: 		Cd = 00;
	CLRF       _Cd+0
;finale_VF.c,92 :: 		k=0,l=0;
	CLRF       _k+0
	CLRF       _l+0
;finale_VF.c,93 :: 		while(PORTB.B7 == 1){
L_chronometre23:
	BTFSS      PORTB+0, 7
	GOTO       L_chronometre24
;finale_VF.c,94 :: 		l=0;
	CLRF       _l+0
;finale_VF.c,95 :: 		while(PORTB.B4 == 1 && k == 0){
L_chronometre25:
	BTFSS      PORTB+0, 4
	GOTO       L_chronometre26
	MOVF       _k+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_chronometre26
L__chronometre55:
;finale_VF.c,96 :: 		display_7seg_2Digit_D(Cg);
	MOVF       _Cg+0, 0
	MOVWF      FARG_display_7seg_2Digit_D_x+0
	CALL       _display_7seg_2Digit_D+0
;finale_VF.c,97 :: 		display_7seg_2Digit_G(Cd);
	MOVF       _Cd+0, 0
	MOVWF      FARG_display_7seg_2Digit_G_x+0
	CALL       _display_7seg_2Digit_G+0
;finale_VF.c,98 :: 		if(PORTB.B7 == 0){delay_ms(250);k=1; break;}
	BTFSC      PORTB+0, 7
	GOTO       L_chronometre29
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_chronometre30:
	DECFSZ     R13+0, 1
	GOTO       L_chronometre30
	DECFSZ     R12+0, 1
	GOTO       L_chronometre30
	DECFSZ     R11+0, 1
	GOTO       L_chronometre30
	NOP
	NOP
	MOVLW      1
	MOVWF      _k+0
	GOTO       L_chronometre26
L_chronometre29:
;finale_VF.c,99 :: 		if(PORTB.B5 == 0){delay_ms(250); Cg = 00; Cd = 00; l=1; break;}
	BTFSC      PORTB+0, 5
	GOTO       L_chronometre31
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_chronometre32:
	DECFSZ     R13+0, 1
	GOTO       L_chronometre32
	DECFSZ     R12+0, 1
	GOTO       L_chronometre32
	DECFSZ     R11+0, 1
	GOTO       L_chronometre32
	NOP
	NOP
	CLRF       _Cg+0
	CLRF       _Cd+0
	MOVLW      1
	MOVWF      _l+0
	GOTO       L_chronometre26
L_chronometre31:
;finale_VF.c,100 :: 		}
	GOTO       L_chronometre25
L_chronometre26:
;finale_VF.c,101 :: 		delay_ms(250);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_chronometre33:
	DECFSZ     R13+0, 1
	GOTO       L_chronometre33
	DECFSZ     R12+0, 1
	GOTO       L_chronometre33
	DECFSZ     R11+0, 1
	GOTO       L_chronometre33
	NOP
	NOP
;finale_VF.c,102 :: 		while(PORTB.B4 == 1 && k == 0 && l == 0 ){
L_chronometre34:
	BTFSS      PORTB+0, 4
	GOTO       L_chronometre35
	MOVF       _k+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_chronometre35
	MOVF       _l+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_chronometre35
L__chronometre54:
;finale_VF.c,103 :: 		display_7seg_2Digit_D(Cg);
	MOVF       _Cg+0, 0
	MOVWF      FARG_display_7seg_2Digit_D_x+0
	CALL       _display_7seg_2Digit_D+0
;finale_VF.c,104 :: 		display_7seg_2Digit_G(Cd);
	MOVF       _Cd+0, 0
	MOVWF      FARG_display_7seg_2Digit_G_x+0
	CALL       _display_7seg_2Digit_G+0
;finale_VF.c,105 :: 		if(Cg>=60){
	MOVLW      60
	SUBWF      _Cg+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_chronometre38
;finale_VF.c,106 :: 		Cd++;
	INCF       _Cd+0, 1
;finale_VF.c,107 :: 		Cg=0;
	CLRF       _Cg+0
;finale_VF.c,108 :: 		}
L_chronometre38:
;finale_VF.c,109 :: 		if(Cd>=60){
	MOVLW      60
	SUBWF      _Cd+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_chronometre39
;finale_VF.c,110 :: 		Cd=0;
	CLRF       _Cd+0
;finale_VF.c,111 :: 		Cg=0;
	CLRF       _Cg+0
;finale_VF.c,112 :: 		}
L_chronometre39:
;finale_VF.c,113 :: 		if(PORTB.B7 == 0){delay_ms(250);k=1; break;}
	BTFSC      PORTB+0, 7
	GOTO       L_chronometre40
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_chronometre41:
	DECFSZ     R13+0, 1
	GOTO       L_chronometre41
	DECFSZ     R12+0, 1
	GOTO       L_chronometre41
	DECFSZ     R11+0, 1
	GOTO       L_chronometre41
	NOP
	NOP
	MOVLW      1
	MOVWF      _k+0
	GOTO       L_chronometre35
L_chronometre40:
;finale_VF.c,114 :: 		if(PORTB.B5 == 0){delay_ms(250); Cg = 00; Cd = 00; break;}
	BTFSC      PORTB+0, 5
	GOTO       L_chronometre42
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_chronometre43:
	DECFSZ     R13+0, 1
	GOTO       L_chronometre43
	DECFSZ     R12+0, 1
	GOTO       L_chronometre43
	DECFSZ     R11+0, 1
	GOTO       L_chronometre43
	NOP
	NOP
	CLRF       _Cg+0
	CLRF       _Cd+0
	GOTO       L_chronometre35
L_chronometre42:
;finale_VF.c,115 :: 		}
	GOTO       L_chronometre34
L_chronometre35:
;finale_VF.c,116 :: 		if(k == 1){ break;}
	MOVF       _k+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_chronometre44
	GOTO       L_chronometre24
L_chronometre44:
;finale_VF.c,117 :: 		delay_ms(250);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_chronometre45:
	DECFSZ     R13+0, 1
	GOTO       L_chronometre45
	DECFSZ     R12+0, 1
	GOTO       L_chronometre45
	DECFSZ     R11+0, 1
	GOTO       L_chronometre45
	NOP
	NOP
;finale_VF.c,118 :: 		}
	GOTO       L_chronometre23
L_chronometre24:
;finale_VF.c,119 :: 		delay_ms(250);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_chronometre46:
	DECFSZ     R13+0, 1
	GOTO       L_chronometre46
	DECFSZ     R12+0, 1
	GOTO       L_chronometre46
	DECFSZ     R11+0, 1
	GOTO       L_chronometre46
	NOP
	NOP
;finale_VF.c,120 :: 		}
L_end_chronometre:
	RETURN
; end of _chronometre

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;finale_VF.c,121 :: 		void interrupt(){
;finale_VF.c,122 :: 		if(INTCON.TMR0IF == 1){
	BTFSS      INTCON+0, 2
	GOTO       L_interrupt47
;finale_VF.c,123 :: 		t++;   Cg++;
	INCF       _t+0, 1
	INCF       _Cg+0, 1
;finale_VF.c,124 :: 		if(t==61){secondes++;  t=0;Cg=0;}
	MOVF       _t+0, 0
	XORLW      61
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt48
	INCF       _secondes+0, 1
	CLRF       _t+0
	CLRF       _Cg+0
L_interrupt48:
;finale_VF.c,125 :: 		if(Cg==60){ Cg=0;}
	MOVF       _Cg+0, 0
	XORLW      60
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt49
	CLRF       _Cg+0
L_interrupt49:
;finale_VF.c,126 :: 		}
L_interrupt47:
;finale_VF.c,127 :: 		INTCON.TMR0IF = 0;
	BCF        INTCON+0, 2
;finale_VF.c,135 :: 		}
L_end_interrupt:
L__interrupt64:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;finale_VF.c,136 :: 		void main() {
;finale_VF.c,137 :: 		OPTION_reg = 0b00010101;
	MOVLW      21
	MOVWF      OPTION_REG+0
;finale_VF.c,138 :: 		INTCON = 0b10100100;
	MOVLW      164
	MOVWF      INTCON+0
;finale_VF.c,139 :: 		TMR0 = 0;
	CLRF       TMR0+0
;finale_VF.c,140 :: 		t = 0;
	CLRF       _t+0
;finale_VF.c,141 :: 		TRISA = 0x00;
	CLRF       TRISA+0
;finale_VF.c,142 :: 		TRISB = 0xB0;
	MOVLW      176
	MOVWF      TRISB+0
;finale_VF.c,143 :: 		PORTA = 0;
	CLRF       PORTA+0
;finale_VF.c,144 :: 		PORTB = 0;
	CLRF       PORTB+0
;finale_VF.c,145 :: 		while(1){
L_main50:
;finale_VF.c,146 :: 		if(PORTB.B7 == 0){
	BTFSC      PORTB+0, 7
	GOTO       L_main52
;finale_VF.c,147 :: 		reglage(void);
	CALL       _reglage+0
;finale_VF.c,148 :: 		}
L_main52:
;finale_VF.c,149 :: 		if(PORTB.B4 == 0){
	BTFSC      PORTB+0, 4
	GOTO       L_main53
;finale_VF.c,150 :: 		chronometre();
	CALL       _chronometre+0
;finale_VF.c,151 :: 		}
L_main53:
;finale_VF.c,152 :: 		horloge();
	CALL       _horloge+0
;finale_VF.c,153 :: 		}
	GOTO       L_main50
;finale_VF.c,154 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
