/* --------------------------Usercode Section------------------------ */
   
import java_cup.runtime.*;
      
%%
   
/* -----------------Options and Declarations Section----------------- */

%class SimplesLexer
%line
%column
%cup
   

%{   
    
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}
   
digit           = [0-9]  
LineTerminator = \r|\n|\r\n
WhiteSpace     = {LineTerminator} | [ \t\f]
integer   =   {digit}+
float = {integer}\.{integer}
identifier = [A-Za-z_][A-Za-z_0-9]*
texto = \"([^\"\\]|\\.)*\"     

commentinicio   = \/\*
commentfim      = \*\/
naocommentfim   = [^\*\/]
commentbody     = {naocommentfim}*
comment =  {commentinicio}{commentbody}{commentfim} | \/\/[a-zA-Z0-9 \t]*  

%%
/* ------------------------Lexical Rules Section---------------------- */

   
<YYINITIAL> {

    /* Pontuação e operadores */
    ";"                {  return symbol(sym.SEMI);     }
    "+"                {  return symbol(sym.PLUS);     }
    "-"                {  return symbol(sym.MINUS);    }
    "*"                {  return symbol(sym.TIMES);    }
    "div"              {  return symbol(sym.DIVIDE);   }
    "("                {  return symbol(sym.LPAREN);   }
    ")"                {  return symbol(sym.RPAREN);   }
    "["                {  return symbol(sym.LBRCKT);   }
    "]"                {  return symbol(sym.RBRCKT);   }
    "<-"               {  return symbol(sym.ASSIGN);   }
    "="                {  return symbol(sym.EQUALS);   }
    ">"                {  return symbol(sym.GREATER);  }
    "<"                {  return symbol(sym.LESS);     }
    ","                {  return symbol(sym.COMMA);    }

    /* I/O Operadores */
    "leia"             {  return symbol(sym.READLINE); }
    "escreva"          {  return symbol(sym.WRITELINE);}
    "escreval"         {  return symbol(sym.ESCREVAL); }

    /* Estruturas de programa */
    "programa"         {  return symbol(sym.PROGRAM);  }
    "inicio"           {  return symbol(sym.STARTPRG); }
    "fim"              {  return symbol(sym.ENDPRG);   }

    /* Tipos de declarações */
    "inteiro"          {  return symbol(sym.DECLINT);  }
    "flutuante"        {  return symbol(sym.DECLFLOAT);}
    "vazio"            {  return symbol(sym.VOID);     }

    /* Controle de fluxo - Condicional */
    "se"               {  return symbol(sym.IFF);      }
    "entao"            {  return symbol(sym.THENN);    }
    "senao"            {  return symbol(sym.ELSEE);    }
    "fimse"            {  return symbol(sym.ENDELSE);  }

    /* Controle de fluxo - Loops */
    "nao"              {  return symbol(sym.NAO);      }
    "para"             {  return symbol(sym.PARA);     }
    "de"               {  return symbol(sym.DE);       }
    "ate"              {  return symbol(sym.ATE);      }
    "passo"            {  return symbol(sym.PASSO);    }
    "faca"             {  return symbol(sym.FACA);     }
    "fimpara"          {  return symbol(sym.FIMPARA);  }
    "enquanto"         {  return symbol(sym.ENQUANTO); }
    "fimenquanto"      {  return symbol(sym.FIMENQUANTO);}

    /* Operadores de lógica */
    "e"                {  return symbol(sym.E);        }
    "ou"               {  return symbol(sym.OU);       }
    

    /* Funções */
    "procedimento"     {  return symbol(sym.PROCEDURE);}
    "retorna"          {  return symbol(sym.RETURN);   } 
 
    /* Literais e identificadores */
    {integer}          { return symbol(sym.INTT,yytext());    }
    {float}            { return symbol(sym.FLOATT, yytext()); }
    {texto}            { return symbol(sym.TEXTO, yytext());  }
    {identifier}       { return symbol(sym.ID, yytext());     } 

    /* Comentários e espaços limpos */
    {WhiteSpace}       { /* just skip what was found, do nothing */ }   
    {comment}          { /* just skip what was found, do nothing */ }   
}

[^]                    { System.err.println("Error: Caracter Ilegal <"+yytext()+"> na linha: " + yyline); }
