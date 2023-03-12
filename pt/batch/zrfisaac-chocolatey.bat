@echo off
setlocal enabledelayedexpansion
rem # [ zrfisaac ]

rem # [ sobre ]
rem # - autor : Isaac Santana
rem # . - email : zrfisaac@gmail.com
rem # . - site : zrfisaac.github.io
rem # - base : zrfisaac.pt.batch.chocolatey - 0.0.1
rem # - descricao : nenhum
rem # - versao : zrfisaac.pt.batch.zrfisaac.chocolatey - 0.0.1

rem # [ batch ]

rem # : - config - chocolatey
set c_chocolatey=
set c_chocolatey=!c_chocolatey! 7zip
set c_chocolatey=!c_chocolatey! git
set c_chocolatey=!c_chocolatey! ruby
set c_chocolatey=!c_chocolatey! nodejs
set c_chocolatey=!c_chocolatey! ffmpeg
set c_chocolatey=!c_chocolatey! nsis
set c_chocolatey=!c_chocolatey! sqlite
set c_chocolatey=!c_chocolatey! dbeaver
set c_chocolatey=!c_chocolatey! notepadplusplus
set c_chocolatey=!c_chocolatey! meld
set c_chocolatey=!c_chocolatey! godot
set c_chocolatey=!c_chocolatey! steam
set c_chocolatey=!c_chocolatey! snes9x
set c_chocolatey=!c_chocolatey! googlechrome
set c_chocolatey=!c_chocolatey! discord
set c_chocolatey=!c_chocolatey! qbittorrent
set c_chocolatey=!c_chocolatey! vlc
set c_chocolatey=!c_chocolatey! virtualbox
set c_chocolatey=!c_chocolatey! vscode
set c_chocolatey=!c_chocolatey! visualstudio2022community
set c_chocolatey=!c_chocolatey! frhed
set c_chocolatey=!c_chocolatey! audacity

rem # : - variable
set v_admin=0
net session >nul 2>&1
if "%errorlevel%" equ "0" set v_admin=1
set v_mensagem=

rem # : - comecar
echo # [ comecar ]
echo # - fonte : %~0
echo.

rem # : - principal
if "0" equ "0" (
	rem # : - titulo
	echo # [ principal ]

	rem # : - verifica
	if "0" equ "0" if "!v_mensagem!" equ "" (
		echo # - verifica
		if "%v_admin%" equ "0" set v_mensagem=execute como administrador
	)

	rem # : - chocolatey
	if "0" equ "0" if "!v_mensagem!" equ "" if not exist "C:\ProgramData\chocolatey" (
		echo # - chocolatey
		PowerShell -command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
		if exist "C:\ProgramData\chocolatey" set v_mensagem=execute mais uma vez
	)

	rem # : - pacote
	if "0" equ "0" if "!v_mensagem!" equ "" (
		echo # - pacote
		for %%z in (%c_chocolatey%) do (
			if not exist "C:\ProgramData\chocolatey\lib\%%z" (
				echo # - pacote : %%z
				choco install %%z --force --force-dependencies --confirm --ignore-checksums
			)
		)
	)

	rem # : - fim
	echo.
)

rem # : - terminar
echo # [ terminar ]
set /p _=
