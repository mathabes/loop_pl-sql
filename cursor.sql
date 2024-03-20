CREATE TABLE FUNCIONARIO(
    cd_fun NUMBER(9) primary key,
    nm_fun VARCHAR2(50),
    salario NUMBER(9,2),
    dt_adm date
)


INSERT INTO FUNCIONARIO(cd_fun, nm_fun, salario, dt_adm) VALUES (1, 'João', 10000, TO_DATE('17/04/2000', 'dd/mm/yyyy'));
INSERT INTO FUNCIONARIO(cd_fun, nm_fun, salario, dt_adm) VALUES (2, 'Claudia', 16000, TO_DATE('02/10/1998', 'dd/mm/yyyy'));
INSERT INTO FUNCIONARIO(cd_fun, nm_fun, salario, dt_adm) VALUES (3, 'Joaquim', 5500, TO_DATE('10/07/2010', 'dd/mm/yyyy'));
INSERT INTO FUNCIONARIO(cd_fun, nm_fun, salario, dt_adm) VALUES (4, 'Valéria', 7300, TO_DATE('08/06/2015', 'dd/mm/yyyy'));


SET SERVEROUTPUT ON
declare
    cursor c_func is SELECT NM_FUN, SALARIO FROM FUNCIONARIO;

begin
    FOR REG IN C_FUNC LOOP
        DBMS_OUTPUT.PUT_LINE('Nome: ' || REG.NM_FUN);
        DBMS_OUTPUT.PUT_LINE('Salário: ' || REG.SALARIO);
    END LOOP;
end;