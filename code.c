#include <stdio.h>
#include <string.h>
#include "symbolTable.h"
#include "code.h"

int indexTableInstruction = 0;

typedef struct ligne{
    char opera[5];
    int var1;
    int var2;
    int var3;
}ligne;

ligne tabInstruction[1024];

void print_ins() {
    for (int i = 0; i < indexTableInstruction; i++) {
        printf("%s %d %d %d\n", tabInstruction[i].opera, tabInstruction[i].var1, tabInstruction[i].var2, tabInstruction[i].var3);
    }
}

void addLigne (ligne newLine){
    tabInstruction[indexTableInstruction] = newLine;
    indexTableInstruction++;
}

void add_arit(char opera[5], int a, int b, int c){
    ligne newLine;
    strcpy(newLine.opera, opera);
    newLine.var1 = a;
    newLine.var2 = b;
    newLine.var3 = c;
    addLigne(newLine);
    freeVar();
}

void add_inst3(char opera[5], int a, int b){
    ligne newLine;
    strcpy(newLine.opera, opera);
    newLine.var1 = a;
    newLine.var2 = b;
    newLine.var3 = 0;
    addLigne(newLine);
}

void add_inst2(char opera[5], int a){
    ligne newLine;
    strcpy(newLine.opera, opera);
    newLine.var1 = a;
    newLine.var2 = 0;
    newLine.var3 = 0;
    addLigne(newLine);
}

void add_inst(char opera[5]){
    ligne newLine;
    strcpy(newLine.opera, opera);
    newLine.var1 = 0;
    newLine.var2 = 0;
    newLine.var3 = 0;
    addLigne(newLine);
}

int get_nb_lignes_asm(){
    return(indexTableInstruction-1);
}

// void patch(){}

