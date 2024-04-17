/*create table aluno(rm number(1), nome varchar2(20));

insert into aluno values (1, 'Jo�o');
insert into aluno values (2, 'Maria');
insert into aluno values (3, 'Jos�');
insert into aluno values (3, 'Jos�');
commit;
*/

SET SERVEROUTPUT ON
DECLARE
    V_CONTA NUMBER(2);
    TURMA_CHEIA EXCEPTION;
BEGIN
    SELECT COUNT(RM) INTO V_CONTA FROM ALUNO;
    IF V_CONTA = 5 THEN
        RAISE TURMA_CHEIA;
    ELSE
        INSERT INTO ALUNO VALUES (4, 'Rafaela');
    END IF;
EXCEPTION
    WHEN TURMA_CHEIA THEN
        DBMS_OUTPUT.PUT_LINE('N�o foi poss�vel incluir: turma est� cheia');
END;