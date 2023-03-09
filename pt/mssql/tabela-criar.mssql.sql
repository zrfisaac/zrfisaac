-- # [ zrfisaac ]

-- # [ sobre ]
-- # - autor : Isaac Santana
-- # . - email : zrfisaac@gmail.com
-- # . - site : zrfisaac.github.io
-- # - base : nenhum
-- # - descricao : nenhum
-- # - versao : zrfisaac.pt.mssql.tabela.criar - 0.0.1

-- # [ mssql ]

-- # : - codigo
IF NOT EXISTS (
	SELECT TOP 1 NULL
	FROM
		INFORMATION_SCHEMA.TABLES AS AL_TABLE WITH(NOLOCK)
	WHERE 1 = 1
		AND AL_TABLE.TABLE_TYPE = 'BASE TABLE'
		AND AL_TABLE.TABLE_NAME = 'TB_TABELA'
)
BEGIN
	CREATE TABLE TB_TABELA (
		 CL_ID			INT	IDENTITY(1, 1)		NOT NULL
			 CONSTRAINT PK_TB_TABELA_CL_ID
						PRIMARY KEY (CL_ID)
		,CL_NOME		VARCHAR		(  40)		NOT NULL
			CONSTRAINT UN_TB_TABELA_CL_NOME
				UNIQUE(CL_NOME)
		,CL_ATIVO		VARCHAR		(   1)			NULL
			 CONSTRAINT DF_TB_TABELA_CL_ATIVO
				DEFAULT('S')
			,CONSTRAINT CK_TB_TABELA_CL_ATIVO
				CHECK (CL_ATIVO  IN ('S','N'))
		,CL_TABELA		INT							NULL
			CONSTRAINT FK_TB_TABELA_CL_TABELA
				FOREIGN KEY (CL_TABELA)
				REFERENCES TB_TABELA(CL_ID)
	)
END
