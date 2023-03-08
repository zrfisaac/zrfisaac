@echo off
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ sobre ]
rem # - autor : Isaac Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # - base : nenhum
rem # - descricao : modelo basico de script batch
rem # - versao : zrfisaac.pt.batch.modelo - 0.0.1

rem # [ batch ]

rem # : - comecar
echo # [ comecar ]
echo # - fonte : %~0
echo.

rem # : - principal
if "0" equ "0" (
	rem # : - titulo
	echo # [ principal ]

	rem # : - rotina
	if "0" equ "0" (
		echo # - rotina
	)

	rem # : - fim
	echo.
)

rem # : - terminar
echo # [ terminar ]
set /p _=
