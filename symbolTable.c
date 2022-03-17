#include <stdio.h>
#include <string.h>
#include "symbolTable.h"

#define TABSIZE 10

int indexTable = 0;
int depthTable = 0;

typedef struct ligneTab{
    char name[5];
    int addr;
    char type[5];
    int value;
    int depth;
}ligneTab;

ligneTab ST[TABSIZE];

void init(){
    indexTable=0;
    depthTable=0;
} 

void print_ts(){
    for (int i = 0; i<(indexTable); i++){
        printf("name : %s\t",ST[i].name);
        printf("address : %d\t",ST[i].addr);
        printf("type : %s\n",ST[i].type);
        printf("value : %d\t",ST[i].value);
        printf("depth : %d\n\n",ST[i].depth);
    }
}

void add_symbol(char name[5], char type[5]){
    ligneTab newLine;
    strcpy(newLine.name, name);
    strcpy(newLine.type, type);
    newLine.value = 0;
    newLine.depth = depthTable;
    newLine.addr = indexTable;
    ST[indexTable] = newLine;
    indexTable ++;
    printf("%d",indexTable);
}

void incrDepth(){
    depthTable++;
}

// DEFINIR BLOC DANS YACC { CONTENT }

void decrDepth(){
    int i=indexTable;
    while (ST[i-1].depth == depthTable){
        i--;
    }
    indexTable=i;
    depthTable--;
}

int getAddr(char id[5]){
    int i = 0;
    while((i<=indexTable) && !(strcmp(ST[i].name,id))){
        i++;
    }
    if (i > indexTable){
        printf("ID Not found \t");
        return(-1);
    }
    else{return(i-1);}
}

void freeVar(){
    indexTable--;
} 

int main() {
    add_symbol("a","int");
    incrDepth();
    printf("depth : %d\n", depthTable);
    add_symbol("b","int");
    decrDepth();
    printf("depth : %d\n", depthTable);
    add_symbol("c","int");
    print_ts();

    int a = getAddr("a");
    printf("a = %d\n",a);
}

