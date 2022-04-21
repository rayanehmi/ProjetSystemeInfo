#define ADD "ADD"
#define MIN "MIN"
#define DIV "DIV"
#define MUL "MUL"
#define AFC "AFC"
#define COP "COP"
#define PRI "PRI"
#define JMPF "JMPF"



void add_arit(char opera[5], int a, int b, int c);

void add_inst3(char opera[5], int a, int b);

void add_inst2(char opera[5], int a);

void add_inst(char opera[5]);

int get_nb_lignes_asm();

//void addLigne (ligne newLine);