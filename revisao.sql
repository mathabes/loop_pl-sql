/* 20. Implemente uma tabela chamada "Estoque_Produtos" com colunas
"Produto", "Estoque", "Obs". Escreva um bloco PL/SQL que verifique se o
estoque de um produto está abaixo do limite mínimo de 5. Se estiver, exiba
uma mensagem utilizando dbms_output e insira a informação na tabela
"Estoque_Produtos" no campo "Obs".
*/
CREATE TABLE ESTOQUE_PRODUTO(
    PRODUTO VARCHAR2(50),
    ESTOQUE NUMBER (3),
    OBS VARCHAR(100)
)
INSERT INTO ESTOQUE_PRODUTO (PRODUTO, ESTOQUE) VALUES ('Camiseta', 5);
INSERT INTO ESTOQUE_PRODUTO (PRODUTO, ESTOQUE) VALUES ('Calça Jeans', 2);
INSERT INTO ESTOQUE_PRODUTO (PRODUTO, ESTOQUE) VALUES ('Tênis', 7);
INSERT INTO ESTOQUE_PRODUTO (PRODUTO, ESTOQUE) VALUES ('Boné', 10);
INSERT INTO ESTOQUE_PRODUTO (PRODUTO, ESTOQUE) VALUES ('Meias', 3);


SET SERVEROUTPUT ON
DECLARE
    V_MSG VARCHAR2(100);
    V_ESTOCADO NUMBER (3) := 0;
    V_TIPO_PRODUTO VARCHAR2(20);
BEGIN
    FOR ESTOQUE_PRODUTO1 IN (SELECT PRODUTO, ESTOQUE FROM ESTOQUE_PRODUTO) LOOP
        V_ESTOCADO := ESTOQUE_PRODUTO1.ESTOQUE;
        IF V_ESTOCADO < 5 THEN
            V_MSG := 'Precisamos estocar mais ';
            V_TIPO_PRODUTO := ESTOQUE_PRODUTO1.PRODUTO;
            DBMS_OUTPUT.PUT_LINE(V_MSG || V_TIPO_PRODUTO);
            UPDATE ESTOQUE_PRODUTO SET OBS = V_MSG WHERE PRODUTO = V_TIPO_PRODUTO;
        END IF;
    END LOOP;
END;