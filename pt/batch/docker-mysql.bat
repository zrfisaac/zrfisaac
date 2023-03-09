@echo off
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ sobre ]
rem # - autor : Isaac Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # - base : zrfisaac.pt.batch.modelo - 0.0.1
rem # - descricao : nenhum
rem # - versao : zrfisaac.pt.batch.docker.mysql - 0.0.1

rem # [ batch ]

rem # : - config
set c_name=mysql
set c_password=1234
set c_port=3306
set c_version=latest
rem set c_version=8.0.32
rem set c_version=5.7.41

rem # : - comecar
echo # [ comecar ]
echo # - fonte : %~0
echo.

rem # : - principal
if "0" equ "0" (
	rem # : - titulo
	echo # [ principal ]

	rem # : - docker mysql
	if "0" equ "0" (
		echo # - docker mysql
		call docker run --detach  --name=%c_name% --env="MYSQL_ROOT_PASSWORD=%c_password%" --publish %c_port%:3306 mysql:%c_version%
	)

	rem # : - fim
	echo.
)

rem # : - terminar
echo # [ terminar ]
set /p _=
