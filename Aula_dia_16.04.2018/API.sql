CREATE OR REPLACE PROCEDURE SETREPRESENTANTE( NOME IN REPRESENTANTE.NOME_REPRESENTANTE%TYPE, CPF IN REPRESENTANTE.CPF_REPRESENTANTE%TYPE, ID_REP OUT REPRESENTANTE.IDREPRESENTANTE%TYPE ) IS
TESTE NUMBER;
BEGIN 

SELECT MAX(IDREPRESENTANTE + 1) INTO ID_REP FROM REPRESENTANTE; 

IF ID_REP IS NULL 
THEN ID_REP := 0; 
END IF;

SELECT COUNT(*) INTO TESTE FROM REPRESENTANTE WHERE NOME_REPRESENTANTE LIKE NOME OR CPF_REPRESENTANTE = CPF;

IF TESTE > 0 
THEN RAISE_APPLICATION_ERROR(-20001, 'NOME OU CPF REPETIDO');
ELSE
INSERT INTO REPRESENTANTE(IDREPRESENTANTE, NOME_REPRESENTANTE, CPF_REPRESENTANTE) VALUES(ID_REP, NOME, CPF);
END IF;
END;
/


CREATE OR REPLACE PROCEDURE SETCLIENTE( NOME IN CLIENTE.NOME_CLIENTE%TYPE, 
	CNPJ IN CLIENTE.CNPJ_CLIENTE%TYPE, 
	RAMO IN CLIENTE.RAMO_ATIVIDADE%TYPE, 
	CIDADE IN CLIENTE.CIDADE%TYPE, 
	ESTADO IN CLIENTE.ESTADO%TYPE, 
	ENDERECO IN CLIENTE.ENDERECO%TYPE, 
	ID_CLI OUT CLIENTE.IDCLIENTE%TYPE) IS

TESTE NUMBER;
BEGIN 

SELECT MAX(IDCLIENTE + 1) INTO ID_CLI FROM CLIENTE; 

IF ID_CLI IS NULL 
THEN ID_CLI := 0; 
END IF;

SELECT COUNT(*) INTO TESTE FROM CLIENTE WHERE NOME_CLIENTE LIKE NOME OR CNPJ_CLIENTE = CNPJ;

IF TESTE > 0 
THEN RAISE_APPLICATION_ERROR(-20001, 'NOME OU CNPJ REPETIDO');
ELSE
INSERT INTO CLIENTE(IDCLIENTE, NOME_CLIENTE, CNPJ_CLIENTE, RAMO_ATIVIDADE, CIDADE, ESTADO, ENDERECO) VALUES(ID_CLI, NOME, CNPJ, RAMO, CIDADE, ESTADO, ENDERECO);
END IF;
END;
/



DECLARE 
 VARIAVEL NUMBER;
BEGIN 
 SETCLIENTE('JAOZINHO', 15169832000103, 'Casa de Diversão', 'Curitiba', 'Parana', 'Rua Frei Caneco 6969', VARIAVEL);
 DBMS_OUTPUT.PUT_LINE('ID DO CLIENTE');
 DBMS_OUTPUT.PUT_LINE(VARIAVEL);
END;


CREATE OR REPLACE PROCEDURE SETPRODUTO( NOME IN PRODUTO.DSPRODUTO%TYPE, MARCA IN PRODUTO.DSMARCA%TYPE, ID_PROD OUT PRODUTO.IDPRODUTO%TYPE) IS 
TESTE NUMBER;
BEGIN 
SELECT MAX(IDPRODUTO + 1) INTO ID_PROD FROM PRODUTO; 

IF ID_PROD IS NULL 
THEN ID_PROD := 0; 
END IF;

SELECT COUNT(*) INTO TESTE FROM PRODUTO WHERE DSPRODUTO LIKE NOME;

IF TESTE > 0 
THEN RAISE_APPLICATION_ERROR(-20001, 'NOME DO PRODUTO REPETIDO');
ELSE
INSERT INTO PRODUTO(IDPRODUTO, DSPRODUTO, DSMARCA) VALUES(ID_PROD, NOME, MARCA);
END IF;
END;
/


DECLARE 
 VARIAVEL NUMBER;
BEGIN 
 SETPRODUTO('PRODUTO_2', 'MARCA_2', VARIAVEL);
 DBMS_OUTPUT.PUT_LINE('ID DO PRODUTO');
 DBMS_OUTPUT.PUT_LINE(VARIAVEL);
END;
