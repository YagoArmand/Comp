#include <stdio.h>
#include <stdlib.h>

int main(){
   int a;
   int b=5;
   int c;
   int f;
   int i;
   float d;
   int teste[10];
   scanf("%d",&a);
   scanf("%d",&c);
   scanf("%d",&f);
   scanf("%f",&d);
   b=(a+b)*c/c;
   f=5+2;
   c=c+f*5;
   printf("\n%d",b);
   printf("\n%d",f);
   printf("\n%d",c);
   printf("\n%f",d);
   printf("%s\n","testando");
   printf("%s","helloworld");
   printf("%d\n",a+b);
   if(b>f){   
      printf("\n%d",b);
   }
   else{   
      printf("\n%d",f);
   }
   if(a==5){   
      if(b>5){      
         if(c<10){         
            printf("\n%d",a+b+c);
         }
      }
   }
   while((b>f&&a<1000)||a<f){   
      printf("\n%d",f*10);
      f=f-1;
      while((b==10)){      
         printf("\n%d",b);
         b=b-2;
      }
   }
   for(i = 1;i < 10;i += 2){   
      printf("\n%d",i);
   }
   for(i = 1;i > 10;i += -1){   
      printf("\n%d",i);
   }
}
