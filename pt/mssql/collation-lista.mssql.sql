-- # [ zrfisaac ]

-- # [ sobre ]
-- # - autor : Isaac Santana
-- # . - email : zrfisaac@gmail.com
-- # . - site : zrfisaac.github.io
-- # - base : nenhum
-- # - descricao : nenhum
-- # - versao : zrfisaac.pt.mssql.collation.lista - 0.0.1

-- # [ mssql ]

-- # : - codigo
SELECT
	 [NAME]
	AS NOME
	,[DESCRIPTION]
	AS DESCRICAO
FROM
	SYS.FN_HELPCOLLATIONS()
ORDER BY
	NOME
