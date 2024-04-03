/*
CREATE TABLE FUNCIONARIO(
    cd_fun NUMBER(9) primary key,
    nm_fun VARCHAR2(50),
    salario NUMBER(9,2),
    nm_departamento varchar2(50)
)

INSERT INTO FUNCIONARIO(cd_fun, nm_fun, salario, nm_departamento) VALUES (1, 'João', 10000, 'RH');
INSERT INTO FUNCIONARIO(cd_fun, nm_fun, salario, nm_departamento) VALUES (2, 'Claudia', 16000, 'Administração');
INSERT INTO FUNCIONARIO(cd_fun, nm_fun, salario, nm_departamento) VALUES (3, 'Joaquim', 5500, 'Agente de Campo');
INSERT INTO FUNCIONARIO(cd_fun, nm_fun, salario, nm_departamento) VALUES (4, 'Gustavo', 2000, 'RH');
*/

SET SERVEROUTPUT ON
DECLARE
    CURSOR C_FUNCIONARIO IS SELECT * FROM FUNCIONARIO;
    V_FUNCIONARIO C_FUNCIONARIO %ROWTYPE;
    V_MEDIA NUMBER(10, 2) := 0;
    V_CONTADOR NUMBER(10):= 0;
BEGIN
    OPEN C_FUNCIONARIO;
    LOOP
        FETCH C_FUNCIONARIO INTO V_FUNCIONARIO;
        IF V_FUNCIONARIO.NM_DEPARTAMENTO = 'RH' THEN
            V_MEDIA := V_MEDIA + V_FUNCIONARIO.SALARIO;
        END IF;
        V_CONTADOR := V_CONTADOR + 1;
        EXIT WHEN C_FUNCIONARIO %NOTFOUND;
    END LOOP;
    CLOSE C_FUNCIONARIO;
    IF V_MEDIA = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum funcionário encontrado para o departamento RH');
    END IF;
    V_MEDIA := V_MEDIA / V_CONTADOR;
    DBMS_OUTPUT.PUT_LINE('Média dos salários de RH : ' || V_MEDIA);
END;
