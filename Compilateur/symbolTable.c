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
        printf("type : %s\t",ST[i].type);
        printf("depth : %d\n",ST[i].depth);
    }
}

void add_symbol(char name[5], char type[5]){

    // si la var existe 
    ligneTab newLine;
    strcpy(newLine.name, name);
    strcpy(newLine.type, type);
    newLine.depth = depthTable;
    newLine.addr = indexTable;
    ST[indexTable] = newLine;
    indexTable ++;
    
    
    //printf("%d",indexTable);
}

void incrDepth(){
    depthTable++;
}


void decrDepth(){
    int i=indexTable;
    while (ST[i-1].depth == depthTable){
        i--;
    }
    indexTable=i;
    depthTable--;
}

int getAddr(char id[5]){
    //printf("getAddr %s\n", id);
    //print_ts();
    //printf("===\n");
    int i = 0;
    while((i<indexTable) && strcmp(ST[i].name,id)){
        i++;
    }
    //printf("i: %d\n", i);
    if (i >= indexTable){
        //printf("ID Not found \t");

        return(-1);
    }
    else{return(i);}
}

int addTmp(){
    indexTable++;
    return indexTable-1;
} 

void freeVar(){
    indexTable--;
} 

int avant_derniere(){
    return (indexTable-2);
}

int derniere(){
    return (indexTable-1);
}

int getLastVal(){
    return(ST[indexTable].value);
}

int getBeforeLastVal(){
    return(ST[indexTable - 1].value);
}
/*
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

*/