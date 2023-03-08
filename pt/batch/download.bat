@echo off
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ sobre ]
rem # - autor : Isaac Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # - base : zrfisaac.pt.batch.modelo - 0.0.1
rem # - descricao : modelo basico de script batch
rem # - versao : zrfisaac.pt.batch.download - 0.0.1

rem # [ batch ]

rem # : - config
set c_download=
set c_download=%c_download% .
set c_caminho=%~dp0
set c_caminho=%c_caminho:~0,-1%

rem # : - especial
set s_espaco= 

rem # : - comecar
echo # [ comecar ]
echo # - fonte : %~0
echo.

rem # : - principal
if "0" equ "0" (
	rem # : - titulo
	echo # [ principal ]

	rem # : - download
	if "0" equ "0" (
		echo # - download
		for %%z in (!c_download!) do (
			if exist "%c_caminho%\%%z" (
				pushd "%c_caminho%\%%z"
				for /r %%y in (*.zrfi) do (
					set _arquivo=%%~nxy
					set _caminho=%%~dpy
					set _caminho=!_caminho:~0,-1!
					pushd "!_caminho!"
					set _linha=
					set _zrfisaac=0
					set _secao=
					set _caminho=
					set _date=
					for /f "usebackq tokens=*" %%x in ("!_arquivo!") do (
						set _linha=%%x
						if "!_linha:~0,14!" equ "# [ zrfisaac ]" set _zrfisaac=1
						if "!_linha:~0,14!" neq "# [ zrfisaac ]" if "!_zrfisaac!" neq "0" if "!_linha:~0,4!" equ "# [ " set _secao=!_linha:~4,-2!
						if "!_linha:~0,14!" neq "# [ zrfisaac ]" if "!_zrfisaac!" neq "0" if "!_linha:~0,4!" neq "# [ " if "!_secao!" equ "path" (
							if "!_linha:~0,6!" equ "# - : " set _caminho=!_linha:~6!
							if "!_caminho!" neq "" if not exist "!_caminho!" (
								rem # : - variavel
								if "!_linha:~0,6!" equ "# - : " echo # - download : !_caminho!
								if "!_linha:~0,13!" equ "# . - date : " set _date=!_linha:~13!

								rem # : powershell
								if "!_linha:~0,19!" equ "# . - powershell : " set _powershell=!_linha:~19!
								if "!_linha:~0,19!" equ "# . - powershell : " (
									set /a _i0=0
									set _s0=!_caminho:/=%s_espaco%!
									set _s1=
									set _pasta=
									for %%z in (!_s0!) do (
										set /a _i0+=1
										set _pasta=!_s1!
										set _s1=!_s1!\%%z
									)
									if "!_i0!" neq "0" if "!_i0!" neq "1" mkdir "%c_caminho%!_pasta!"
									powershell -Command "(New-Object Net.WebClient).DownloadFile('!_powershell!', '!_caminho!')"
								)
							)
						)
					)
					popd
				)
				popd
			)
		)
	)

	rem # : - fim
	echo.
)

rem # : - terminar
echo # [ terminar ]
set /p _=
