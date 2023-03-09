-- # [ zrfisaac ]

-- # [ sobre ]
-- # - autor : Isaac Santana
-- # . - email : zrfisaac@gmail.com
-- # . - site : zrfisaac.github.io
-- # - base : nenhum
-- # - descricao : nenhum
-- # - versao : zrfisaac.pt.mssql.tabela.lista - 0.0.1

-- # [ mssql ]

-- # : - parametro
DECLARE
	 @P_TABELA	VARCHAR( 116)	=	''

-- # : - codigo
SELECT
	 AL_TABLE.TABLE_NAME
	AS CL_TABELA
FROM
	INFORMATION_SCHEMA.TABLES AS AL_TABLE WITH(NOLOCK)
WHERE 1 = 1
	AND AL_TABLE.TABLE_TYPE = 'BASE TABLE'
	AND AL_TABLE.TABLE_NAME LIKE '%' + ISNULL(@P_TABELA + '%','')
ORDER BY
	 CL_TABELA	ASC
