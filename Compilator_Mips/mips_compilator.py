import re
# writing to file
#file1 = open('myfile.txt', 'w')
#file1.writelines(L)
#file1.close()
 

file1 = open('myfile.txt', 'r')
AssemblyLines = file1.readlines()
 
count = 0

Etichete=[0]*100

def GetRegisterValue(reg):
    reg=reg.replace('$','')
    reg=reg.replace(',','')
    reg=reg.replace(' ','')
    reg=reg.replace('(','')
    reg=reg.replace(')','')
    if(reg=='zero'):
        return 0
    elif(reg=='at'):
        return 1
    elif(reg=='v0'):
        return 2
    elif(reg=='v1'):
        return 3
    elif(reg=='a0'):
        return 4
    elif(reg=='a1'):
        return 5
    elif(reg=='a2'):
        return 6
    elif(reg=='a3'):
        return 7
    elif(reg=='t0'):
        return 8
    elif(reg=='t1'):
        return 9
    elif(reg=='t2'):
        return 10
    elif(reg=='t3'):
        return 11
    elif(reg=='t4'):
        return 12
    elif(reg=='t5'):
        return 13
    elif(reg=='t6'):
        return 14
    elif(reg=='t7'):
        return 15
    elif(reg=='s0'):
        return 16
    elif(reg=='s1'):
        return 17
    elif(reg=='s2'):
        return 18
    elif(reg=='s3'):
        return 19
    elif(reg=='s4'):
        return 20
    elif(reg=='s5'):
        return 21
    elif(reg=='s6'):
        return 22
    elif(reg=='s7'):
        return 23
    elif(reg=='t8'):
        return 24
    elif(reg=='t9'):
        return 25
    elif(reg=='k0'):
        return 26
    elif(reg=='k1'):
        return 27
    elif(reg=='gp'):
        return 28
    elif(reg=='sp'):
        return 29
    elif(reg=='fp'):
        return 30
    elif(reg=='ra'):
        return 31
    return -1;

def RegBinary(reg):
    imm=0
    imm=int(GetRegisterValue(reg))
    imm=int(imm)
    imm=bin(imm)[2:]
    imm=imm.zfill(5)
    return imm


for line in AssemblyLines:
    if ':' in line:
        substrings = line.split(':')
        eticheta=substrings[0]
        Etichete[count]=eticheta
        
    count += 1


for line in AssemblyLines:
   
    
    #scoatem comentariile
    if '#' in line:
        substrings = line.split('#')
        line1=substrings[0]
        print(line1)
    elif ':' in line: 
        print(line)
    else:
        line1=line
        print(line1)
    instr=''
    final='' #intermeddiate value,funct value
    shamt='00000'
    #R
    if 'add ' in line1:
        instr+='000000'
        final='100000'
        registrii=[]*4
        registrii = re.findall(r'\$[^\s]+', line1)
        cnt=0;
        for reg in registrii:
            registrii[cnt]=RegBinary(reg);
            cnt+=1
        instr+=registrii[1]
        instr+=registrii[2]
        instr+=registrii[0]
        instr+=shamt
        instr+=final
       

    elif 'sub ' in line1:
        instr+='101011'
        final='100010'
        registrii=[]*4
        registrii = re.findall(r'\$[^\s]+', line1)
        cnt=0;
        for reg in registrii:
            registrii[cnt]=RegBinary(reg);
            cnt+=1
        instr+=registrii[1]
        instr+=registrii[2]
        instr+=registrii[0]
        instr+=shamt
        instr+=final
    #I
    if 'addi ' in line1:
        instr+='001000'
        sub = line1.split(',')
        imm=sub[2]
        imm=int(imm)
        imm=bin(imm)[2:]
        imm=imm.zfill(16)
        registrii=[]*4
        registrii = re.findall(r'\$[^\s]+', line1)
        cnt=0;
        for reg in registrii:
            registrii[cnt]=RegBinary(reg);
            cnt+=1
        instr+=registrii[1]
        instr+=registrii[0]
        instr+=imm


    elif 'lw ' in line1:
        instr+='100011'
        registrii=[]*4
        registrii = re.findall(r'\$[^\s]+', line1)
        imm1= re.findall(r'\d+\(', line1)
        imm=imm1[0].replace('(','')
        imm=int(imm)
        imm=bin(imm)[2:]
        imm=imm.zfill(16)
        
        cnt=0;
        for reg in registrii:
            registrii[cnt]=RegBinary(reg);
            cnt+=1
        instr+=registrii[1]
        instr+=registrii[0]
        instr+=imm
        
    elif 'sw ' in line1:
        instr+='101011'
        registrii=[]*4
        registrii = re.findall(r'\$[^\s]+', line1)
        imm1= re.findall(r'\d+\(', line1)
        imm=imm1[0].replace('(','')
        imm=int(imm)
        imm=bin(imm)[2:]
        imm=imm.zfill(16)
        
        cnt=0;
        for reg in registrii:
            registrii[cnt]=RegBinary(reg);
            cnt+=1
        instr+=registrii[1]
        instr+=registrii[0]
        instr+=imm
    elif 'beq ' in line1:
        instr+='000100'
        registrii=[]*4
        registrii = re.findall(r'\$[^\s]+', line1)
        imm1= re.findall(r'\d+\(', line1)
        imm=imm1[0].replace('(','')
        imm=int(imm)
        imm=bin(imm)[2:]
        imm=imm.zfill(16)
        
        cnt=0;
        for reg in registrii:
            registrii[cnt]=RegBinary(reg);
            cnt+=1
        instr+=registrii[1]
        instr+=registrii[0]
        instr+=imm
    
    #J
    if 'j ' in line1:
        instr+='000010'
        sub = line1.split(' ')
        imm=sub[1]
        imm=Etichete.index(imm)
        imm=bin(imm)[2:]
        imm=imm.zfill(26)
        instr+=imm

    print(instr)
    f=open("output.txt","a")
    f.write('\n')
    f.write(instr)
    
    f.close()
f=open("output.txt","a")
f.write('\n')
f.write('\n')
f.close()
    



