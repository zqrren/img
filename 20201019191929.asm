DATA SEGMENT
        ORG 0500H
DATA1   DB 25H,31H,33H,36H,65H
        ORG 050AH
DATA2   DB 5 DUP(?)
DATA ENDS
CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:  MOV AX,DATA
        MOV DS,AX
        MOV SI,OFFSET DATA1
        MOV DI,OFFSET DATA2
        MOV CX,05H
A1:     MOV AL,[SI]
        CMP AL,39H
        JA A2
        CMP AL,30H
        JB A2
        SUB AL,30H
        JMP A3
A2:     MOV AL,0FFH
A3:     INC SI
        INC DI
        MOV [DI],AL
        LOOP A1
        MOV AH,4CH
        INT 21H
CODE ENDS
END START