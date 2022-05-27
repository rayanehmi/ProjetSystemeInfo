#define ADD "ADD"
#define MIN "MIN"
#define DIV "DIV"
#define MUL "MUL"
#define AFC "AFC"
#define COP "COP"
#define PRI "PRI"
#define JMP "JMP"
#define JMF "JMF"
#define INF "INF"
#define SUP "SUP"
#define EQU "EQU"



void add_arit(char opera[5], int a, int b, int c);

void add_inst3(char opera[5], int a, int b);

void add_inst2(char opera[5], int a);

void add_inst(char opera[5]);

int get_nb_lignes_asm();

void patchJMP(int from, int to);

void patchJMF(int from, int to);