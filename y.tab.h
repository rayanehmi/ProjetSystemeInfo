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
    tPARCLOSE = 267,
    tBRAOPEN = 268,
    tBRACLOSE = 269,
    tMAIN = 270,
    tRETURN = 271,
    tIF = 272,
    tELSE = 273,
    tWHILE = 274,
    tCOMMA = 275,
    tQUOTE = 276,
    tPRINTF = 277,
    tSUP = 278,
    tINF = 279,
    tNB = 280,
    tID = 281
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
#define tPARCLOSE 267
#define tBRAOPEN 268
#define tBRACLOSE 269
#define tMAIN 270
#define tRETURN 271
#define tIF 272
#define tELSE 273
#define tWHILE 274
#define tCOMMA 275
#define tQUOTE 276
#define tPRINTF 277
#define tSUP 278
#define tINF 279
#define tNB 280
#define tID 281

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 11 "yacc.y"
 int nb ; char str[16]; 

#line 112 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
