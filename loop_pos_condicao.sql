SET SERVEROUTPUT ON
DECLARE
    V_TABUADA NUMBER(10) := &TABUADA;
    V_CONTADOR NUMBER(2) := 0;
    V_RESPOSTA NUMBER (10);
BEGIN
   WHILE V_CONTADOR <= 10 LOOP
        V_RESPOSTA := V_TABUADA * V_CONTADOR;
        DBMS_OUTPUT.PUT_LINE(V_TABUADA || ' x ' || V_CONTADOR || ' = ' || V_RESPOSTA);
        V_CONTADOR := V_CONTADOR + 1;
    END LOOP;
END;