 unsigned char minut=59;
 unsigned char secondes=00;
 unsigned char i = 0, Cg=00,Cd=00,k,l,t;
//*********************************************//
 void blink_parameter() {
  unsigned char j = 0;
  while(j < 30) {
   j++;
   delay_ms(30);
  }
}
//*********************************************//
void display_7seg_1Digit(unsigned char x){
 PORTB = x;
 PORTA = 0x08 ;
}
//*********************************************//
void display_7seg_2Digit_D(unsigned char x){
 char d,u;
 d = x/10;
 u = x%10;
 PORTA = 0x08;
 PORTB = u;
 delay_ms(1);
 PORTA = 0x04;
 PORTB = d;
 delay_ms(1);
}
//*********************************************//
void display_7seg_2Digit_G(unsigned char x){
 char d,u;
 d = x/10;
 u = x%10;
 PORTA = 0x02;
 PORTB = u;
 delay_ms(1);
 PORTA = 0x01;
 PORTB = d;
 delay_ms(1);
}
//*********************************************//
void horloge(void){
  display_7seg_2Digit_D(secondes);
  display_7seg_2Digit_G(minut);

   if(secondes>=60){
    minut++;
    secondes=0;
   }
   if(minut>59){
    minut=0;
    secondes=0;
   }
}
//*******************************************//
void reglage(void){
unsigned char secondes1 = secondes;
unsigned char minut1 = minut;
 delay_ms(250);
 while(PORTB.B7 == 1){
  display_7seg_2Digit_D(secondes1);
  blink_parameter();
  if(PORTB.B5 == 0){
   delay_ms(250);
   secondes1++;
  }
  if(secondes1 >= 60){
    secondes1 = 0;
  }
 }
 delay_ms(250);
 while(PORTB.B7 == 1){
  display_7seg_2Digit_G(minut1);
  blink_parameter();
  if(PORTB.B5==0){
   delay_ms(250);
   minut1++;
  }
  if(minut1 >= 60){
   minut1=0;
  }
 }
 delay_ms(250);
 secondes = secondes1;
 minut = minut1;
}
//*********************************************//
void chronometre(){
  delay_ms(250);
  Cg = 00;
  Cd = 00;
  k=0,l=0;
  while(PORTB.B7 == 1){
  l=0;
 while(PORTB.B4 == 1 && k == 0){
  display_7seg_2Digit_D(Cg);
  display_7seg_2Digit_G(Cd);
  if(PORTB.B7 == 0){delay_ms(250);k=1; break;}
  if(PORTB.B5 == 0){delay_ms(250); Cg = 00; Cd = 00; l=1; break;}
 }
   delay_ms(250);
  while(PORTB.B4 == 1 && k == 0 && l == 0 ){
  display_7seg_2Digit_D(Cg);
  display_7seg_2Digit_G(Cd);
     if(Cg>=60){
      Cd++;
      Cg=0;
     }
     if(Cd>=60){
      Cd=0;
      Cg=0;
    }
  if(PORTB.B7 == 0){delay_ms(250);k=1; break;}
  if(PORTB.B5 == 0){delay_ms(250); Cg = 00; Cd = 00; break;}
  }
  if(k == 1){ break;}
  delay_ms(250);
 }
  delay_ms(250);
}
void interrupt(){
 if(INTCON.TMR0IF == 1){
  t++;   Cg++;
  if(t==61){secondes++;  t=0;Cg=0;}
   if(Cg==60){ Cg=0;}
 }
  INTCON.TMR0IF = 0;

 /* if(INTCON.RBIF == 1){
       minut++;
  // chronometre();
 }
  INTCON.B0 = 0;*/

}
void main() {
 OPTION_reg = 0b00010101;
 INTCON = 0b10100100;
 TMR0 = 0;
 t = 0;
 TRISA = 0x00;
 TRISB = 0xB0;
 PORTA = 0;
 PORTB = 0;
 while(1){
  if(PORTB.B7 == 0){
   reglage(void);
  }
  if(PORTB.B4 == 0){
   chronometre();
  }
  horloge();
 }
}