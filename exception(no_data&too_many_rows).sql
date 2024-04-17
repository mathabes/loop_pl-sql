/*create table aluno(rm number(1), nome varchar2(20));

insert into aluno values (1, 'Jo�o');
insert into aluno values (2, 'Maria');
insert into aluno values (3, 'Jos�');
insert into aluno values (3, 'Jos�');
commit;
*/

SET SERVEROUTPUT ON
DECLARE
    V_RM ALUNO.RM%TYPE := 3;
    V_NOME ALUNO.NOME%TYPE;
BEGIN
    SELECT NOME INTO V_NOME FROM ALUNO WHERE RM = V_RM;
    DBMS_OUTPUT.PUT_LINE(V_RM || '-' || V_NOME);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('N�o h� nenhum aluno com este RM');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('H� mais de um aluno com este RM');
END;