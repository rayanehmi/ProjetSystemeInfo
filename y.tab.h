/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    tINT = 258,
    tCONST = 259,
    tADD = 260,
    tMIN = 261,
    tMUL = 262,
    tDIV = 263,
    tEQU = 264,
    tSEM = 265,
    tPAROPEN = 266,
    tEXP = 267,
    tPARCLOSE = 268,
    tBRAOPEN = 269,
    tBRACLOSE = 270,
    tMAIN = 271,
    tRETURN = 272,
    tIF = 273,
    tELSE = 274,
    tWHILE = 275,
    tSPACE = 276,
    tCOMMA = 277,
    tTAB = 278,
    tBREAK = 279,
    tQUOTE = 280,
    tPRINTF = 281,
    tSUP = 282,
    tINF = 283,
    tNB = 284,
    tID = 285
  };
#endif
/* Tokens.  */
#define tINT 258
#define tCONST 259
#define tADD 260
#define tMIN 261
#define tMUL 262
#define tDIV 263
#define tEQU 264
#define tSEM 265
#define tPAROPEN 266
#define tEXP 267
#define tPARCLOSE 268
#define tBRAOPEN 269
#define tBRACLOSE 270
#define tMAIN 271
#define tRETURN 272
#define tIF 273
#define tELSE 274
#define tWHILE 275
#define tSPACE 276
#define tCOMMA 277
#define tTAB 278
#define tBREAK 279
#define tQUOTE 280
#define tPRINTF 281
#define tSUP 282
#define tINF 283
#define tNB 284
#define tID 285

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 8 "yacc.y"
 int nb ; char str[16]; 

#line 120 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
