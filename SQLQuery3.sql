
SELECT * FROM [TABELA CARROS]

SELECT * FROM [TABELA VIAGEM]

SELECT
TC.[Id_carro],
TC.[Numero_carro] AS Prefixo_do_carro,
TC.[Chassi] AS Numero_do_Chassi,
TV.[Id_carro],
TV.[Id_viagem],
TV.[Destino],
TV.[Qtd_passageiro],
TV.[Numero_carro],
TOT.[Ponto_de_partida],
TOT.[Ponto_de_chegada],
CONCAT(' R$ ', TV.[Valor_passagem]) AS Preco_tarifa,
CONVERT(varchar(5), TV.[Horario_saida], 108) AS Horario_da_patida
FROM [dbo].[TABELA CARROS] TC
INNER JOIN [dbo].[TABELA VIAGEM] TV
ON TC.[id_carro] = TV.[id_carro]
INNER JOIN
(
SELECT DISTINCT
SUBSTRING([Destino], 1, CHARINDEX('X',[Destino]) -1)
AS Ponto_de_partida,
SUBSTRING([Destino], CHARINDEX('X',[Destino]) +1,
LEN([Destino])) as Ponto_de_chegada
FROM [dbo].[TABELA VIAGEM]
WHERE Qtd_passageiro IS NOT NULL
GROUP BY Destino
)TOT 
ON TC.id_carro = TV.id_carro
ORDER BY TV.Id_carro ASC
GO

/*******************************************************************************************************************************************************
                            Faturamento por carro, Esta errado não pode por sifão de dinheiro nem virculo 
*******************************************************************************************************************************************************/

SELECT DISTINCT
Id_carro,
Id_viagem,
Qtd_passageiro,
CONCAT(' R$ ', [Valor_passagem]) AS Preco_tarifa,
CONVERT(
VARCHAR(30),
CAST(
ROUND(SUM(Valor_passagem * Qtd_passageiro) OVER (PARTITION BY id_carro),2) AS MONEY
),1
) AS Total_faturamento,
LEFT(Destino, CHARINDEX( 'X' , Destino) -1) AS Cidade_origem,
RIGHT(Destino, LEN(Destino) - CHARINDEX( 'X', Destino)) AS Cidade_destino
FROM [TABELA VIAGEM]
WHERE Qtd_passageiro IS NOT NULL
ORDER BY Cidade_destino ASC
GO

/*******************************************************************************************************************************************************                
                                 JOIN entre TABELA_VIAGEM e TABELA_CARROS para exibir Numero_carro
*******************************************************************************************************************************************************/

SELECT
TC.Numero_carro,
TV.Id_carro,
TV.Id_viagem,
TV.Qtd_passageiro,
TV.Valor_passagem AS Preco_tarifa,
CONVERT(varchar(5), TV.[Horario_saida], 108) AS Horario_da_patida,
SUBSTRING(TV.[Destino], 1, CHARINDEX('X',[Destino]) -1)  --Separando a coluna de destino em Ponto_de_partida = Ponto_de_chegada.
AS Ponto_de_partida,                                     
SUBSTRING(TV.[Destino], CHARINDEX('X',[Destino]) +1,        
LEN([Destino])) as Ponto_de_chegada
FROM [TABELA VIAGEM] TV
INNER JOIN [TABELA CARROS] TC
ON TV.Id_carro = TC. Id_carro
ORDER BY Numero_carro ASC
GO

/*******************************************************************************************************************************************************
                              Analisa o faturamento dos carros e classifica por volume de passageiro
*******************************************************************************************************************************************************/

SELECT
Id_carro,
Id_viagem,
Qtd_passageiro,
Valor_passagem AS Preco_tarifa,
CAST(
SUM(Valor_passagem * Qtd_passageiro) OVER (PARTITION BY id_carro) AS DECIMAL (10,2)
) AS Total_faturamento,
RANK() OVER (ORDER BY Qtd_passageiro) AS Ranking_Qtd_passageiro,
LEFT(Destino, CHARINDEX( 'X' , Destino) -1) AS Cidade_origem,
RIGHT(Destino, LEN(Destino) - CHARINDEX( 'X', Destino)) AS Cidade_destino
FROM [TABELA VIAGEM]
WHERE Qtd_passageiro BETWEEN 700 AND 4800
ORDER BY Cidade_destino ASC
GO