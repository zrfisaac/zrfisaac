@echo off
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ sobre ]
rem # - autor : Isaac Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # - base : zrfisaac.pt.batch.modelo.avancado - 0.0.1
rem # - descricao : nenhum
rem # - versao : zrfisaac.pt.batch.json.arquivo - 0.0.1

rem # [ batch ]

rem # : - config
set c_json=_.json

rem # : - especial
set s_aspas_duplas="
set s_aspas_simples='
set s_asterisco=*
set s_circunflexo=^^
set s_espaco= 
set s_igual=^=
set s_maior=^>
set s_mais=+
set s_menor=^<
set s_menos=-
set s_porcentagem=%%
set s_tab=	

rem # : - variavel
set v_admin=0
set v_arquivo=%~nx0
net session >nul 2>&1
if "%errorlevel%" equ "0" set v_admin=1
set errorlevel=0
set v_caminho=%~p0
set v_caminho=%~d0!v_caminho:~0,-1!
set v_config=
set v_debug=1
set v_erro=0
set v_esperar=1
set v_extensao=%~x0
set v_pasta=
pushd "%~dp0"
for %%z in (.) do set v_pasta=%%~nxz
popd
set v_mensagem=
set v_name=%~n0
set v_secao=base
set v_proprio=%~0
set v_silencioso=0
set v_titulo=%~n0
set v_titulo=%v_titulo:-=!s_espaco!%

rem # : - parametro
set /a _i0=0
set _s0=
for %%z in (%*) do (
	rem # : - variavel
	set /a _i0+=1
	set _s1=%%z

	rem # : - debug
	if "!_s1!" equ "--debug" set v_debug=1
	if "!_s1!" equ "--no-debug" set v_debug=0

	rem # : - secao
	if "!_s0!" equ "--secao" set v_secao=!_s1!

	rem # : - silencioso
	if "!_s1!" equ "--silencioso" set v_silencioso=1
	if "!_s1!" equ "--no-silencioso" set v_silencioso=0

	rem # : - esperar
	if "!_s1!" equ "--wait" set v_esperar=1
	if "!_s1!" equ "--no-wait" set v_esperar=0

	rem # : - variavel
	set _s0=!_s1!
)

rem # : - configuracao
if "!v_erro!" equ "0" (
	rem # : - config - underline 02
	if "!v_erro!" equ "0" if "!c_config!" neq "" (
		set v_config=!c_config!\__config.bat
		if exist !v_config! (
			call "!v_config!"
		) else (
			set v_config=
		)
	)

	rem # : - config - underline 01
	if "!v_erro!" equ "0" if "!c_config!" neq "" (
		set v_config=!c_config!\_config.bat
		if exist !v_config! (
			call "!v_config!"
		) else (
			set v_config=
		)
	)

	rem # : - config - default
	if "!v_erro!" equ "0" if "!c_config!" neq "" (
		set v_config=!c_config!\config.bat
		if exist !v_config! (
			call "!v_config!"
		) else (
			set v_config=
		)
	)

	rem # : - local - underline 02
	if "!v_erro!" equ "0" if "!v_config!" equ "" (
		set v_config=!v_caminho!\__config.bat
		if exist !v_config! (
			call "!v_config!"
		) else (
			set v_config=
		)
	)

	rem # : - local - underline 01
	if "!v_erro!" equ "0" if "!v_config!" equ "" (
		set v_config=!v_caminho!\_config.bat
		if exist !v_config! (
			call "!v_config!"
		) else (
			set v_config=
		)
	)

	rem # : - local - default
	if "!v_erro!" equ "0" if "!v_config!" equ "" (
		set v_config=!v_caminho!\config.bat
		if exist !v_config! (
			call "!v_config!"
		) else (
			set v_config=
		)
	)

	rem # : - error
	set v_erro=!errorlevel!
)

rem # : - parametro
set /a _i0=0
set _s0=
for %%z in (%*) do (
	rem # : - variavel
	set /a _i0+=1
	set _s1=%%z

	rem # : - debug
	if "!_s1!" equ "--debug" set v_debug=1
	if "!_s1!" equ "--no-debug" set v_debug=0

	rem # : - local
	if "!_s0!" equ "--local" set v_local=!_s1!

	rem # : - secao
	if "!_s0!" equ "--secao" set v_secao=!_s1!

	rem # : - silencioso
	if "!_s1!" equ "--silencioso" set v_silencioso=1
	if "!_s1!" equ "--no-silencioso" set v_silencioso=0

	rem # : - esperar
	if "!_s1!" equ "--wait" set v_esperar=1
	if "!_s1!" equ "--no-wait" set v_esperar=0

	rem # : - tab
	if "!_s0!" equ "--tab" set v_tab=!_s1!

	rem # : - variavel
	set _s0=!_s1!
)

rem # : - config
if "%c_caminho%" equ "" set c_caminho=%~dp0
set c_caminho=%c_caminho:"=%
if "%c_caminho:~-1%" equ "\" set c_caminho=%c_caminho:~0,-1%

rem # : - variavel
if "!v_local!" equ "" set v_local=!v_caminho!
if "!v_local!" neq "" set v_local=%v_local:"=%
if "!v_tab!" equ "" set v_tab=
if "!v_tab!" neq "" set v_tab=%v_tab:"=%
if "!v_silencioso!" equ "1" (
	set v_debug=0
	set v_esperar=0
)

rem # : - comecar
if "!v_debug!" neq "0" echo # [ !v_titulo! - !v_secao! - comecar ]
if "!v_debug!" neq "0" if "!v_config!" neq "" echo # - config : !v_config!
if "!v_debug!" neq "0" echo.

rem # : - base - principal
if "!v_erro!" equ "0" if "!v_mensagem!" equ "" if "!v_secao!" equ "base" (
	rem # : - titulo
	if "!v_debug!" neq "0" echo # [ !v_titulo! - !v_secao! - principal ]

	rem # : - json
	if "!v_erro!" equ "0" if "!v_mensagem!" equ "" (
		if "!v_debug!" neq "0" echo # - json
		if "!v_local!" equ "!v_caminho!" (
			if exist "!v_caminho!\!c_json!" del /q /s "!v_caminho!\!c_json!" 1>nul
			if "!v_silent!" equ "0" echo # : !v_caminho!
			echo { >> "!v_caminho!\!c_json!"
			echo !s_tab!"caminho":"!v_caminho!",>> "!v_caminho!\!c_json!"
			echo !s_tab!"tipo":"pasta",>> "!v_caminho!\!c_json!"
			echo !s_tab!"filhos":[>> "!v_caminho!\!c_json!"
			set v_tab=!v_tab!!s_tab!
		)
		pushd "!v_local!"
		set /a _i0=0
		for /d %%z in (*) do (
			set /a _i0+=1
			set _s0=%%z
			set _s0=!_s0:%s_porcentagem%=%s_porcentagem%%s_porcentagem%!
			if "!_i0!" neq "1" echo !v_tab!!s_tab!,>> "!v_caminho!\!c_json!"
			echo !v_tab!!s_tab!{>> "!v_caminho!\!c_json!"
			echo !v_tab!!s_tab!!s_tab!"caminho":"!v_local!\%%z",>> "!v_caminho!\!c_json!"
			echo !v_tab!!s_tab!!s_tab!"tipo":"pasta",>> "!v_caminho!\!c_json!"
			echo !v_tab!!s_tab!!s_tab!"filhos":[>> "!v_caminho!\!c_json!"
			if "!v_silent!" equ "0" echo # : !v_local!\!_s0!
			call "!v_self!" --no-wait --no-debug --tab "!v_tab!!s_tab!!s_tab!" --local "!v_local!\!_s0!"
			echo !v_tab!!s_tab!!s_tab!]>>"!v_caminho!\!c_json!"
			echo !v_tab!!s_tab!}>>"!v_caminho!\!c_json!"
		)
		set /a _i1=0
		set /a _i2=0
		for %%y in (*.*) do (
			set /a _i1+=1
			set _s0=%%y
			set _s0=!_s0:%s_porcentagem%=%s_porcentagem%%s_porcentagem%!
			if "!_i0!" neq "0" set _i2=1
			if "!_i1!" neq "1" set _i2=1
			if "!v_silent!" equ "0" echo # : !v_local!\!_s0!
			if "!_i2!" neq "0" echo !v_tab!!s_tab!,>> "!v_caminho!\!c_json!"
			echo !v_tab!!s_tab!{>> "!v_caminho!\!c_json!"
			echo !v_tab!!s_tab!!s_tab!"alteracao":"%%~ty",>> "!v_caminho!\!c_json!"
			echo !v_tab!!s_tab!!s_tab!"extensao":"%%~xy",>> "!v_caminho!\!c_json!"
			echo !v_tab!!s_tab!!s_tab!"caminho":"!v_local!\%%y",>> "!v_caminho!\!c_json!"
			echo !v_tab!!s_tab!!s_tab!"tamanho":"%%~zy",>> "!v_caminho!\!c_json!"
			echo !v_tab!!s_tab!!s_tab!"tipo":"file",>> "!v_caminho!\!c_json!"
			echo !v_tab!!s_tab!}>> "!v_caminho!\!c_json!"
		)
		popd
		if "!v_local!" equ "!v_caminho!" (
			echo !s_tab!]>>"!v_caminho!\!c_json!"
			echo }>> "!v_caminho!\!c_json!"
		)
	)

	rem # : - fim
	if "!v_debug!" neq "0" echo.
)

rem # : - terminar
if "!v_debug!" neq "0" echo # [ !v_titulo! - !v_secao! - terminar ]
if "!v_debug!" neq "0" if "!v_erro!" neq "0" echo # - erro
if "!v_debug!" neq "0" if "!v_mensagem!" neq "" echo # - mensagem : !v_mensagem!
if "!v_debug!" neq "0" if "!v_esperar!" neq "0" set /p _=
if "!v_debug!" neq "0" echo.
