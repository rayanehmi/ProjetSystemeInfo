import pprint

f = "asm.txt"
asm = open(f, "r").readlines()
asm = [ligne.split(" ") for ligne in asm]
asm = [ [ x[0], int(x[1]), int(x[2]), int(x[3]) ] for x in asm]
pprint.pprint(asm)

#############

mem = [0 for k in range(16)]
ip=0 #ou pc
while ip!=len(asm):

  if asm[ip][0] == "AFC" :
    mem[asm[ip][1]] = asm[ip][2]
    ip+=1
    
  elif asm[ip][0] == "COP" :
    mem[asm[ip][1]] = mem[asm[ip][2]]
    ip+=1
    
  elif asm[ip][0] == "ADD" :
    mem[asm[ip][1]] = asm[ip][2] + asm[ip][3]
    ip+=1
  
  elif asm[ip][0] == "SUB" :
    mem[asm[ip][1]] = asm[ip][2] - asm[ip][3]
    ip+=1
    
  elif asm[ip][0] == "MUL" :
    mem[asm[ip][1]] = asm[ip][2] * asm[ip][3]
    ip+=1
    
  elif asm[ip][0] == "DIV" :
    mem[asm[ip][1]] = asm[ip][2] // asm[ip][3]
    ip+=1
    
  elif asm[ip][0] == "JMPF" :
    if mem[asm[ip][2]]==0:
      ip=asm[ip][1]
    else:
      ip+=1
  
  elif asm[ip][0] == "PRI" :
    print(mem[asm[ip][1]])
    

print("\nInterpretation terminée\n")
print("Tableau mémoire :\n")
print(mem)
