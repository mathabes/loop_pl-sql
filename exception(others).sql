/*create table aluno(rm number(1), nome varchar2(20));

insert into aluno values (1, 'João');
insert into aluno values (2, 'Maria');
insert into aluno values (3, 'José');
insert into aluno values (3, 'José');
commit;
*/

SET SERVEROUTPUT ON
DECLARE
    V_RM ALUNO.RM%TYPE := 6;
    V_NOME ALUNO.NOME%TYPE;
BEGIN
    SELECT NOME INTO V_NOME FROM ALUNO WHERE RM = V_RM;
    DBMS_OUTPUT.PUT_LINE(V_RM || '-' || V_NOME);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLCODE);
        DBMS_OUTPUT.PUT_LINE('Mensagem - ' || SQLERRM);
END;