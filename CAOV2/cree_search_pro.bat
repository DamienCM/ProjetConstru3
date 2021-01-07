@echo off
cls

:###############################################################
:#                                                             #
:# Fichier cree_search_pro.bat                                 #
:# Créé par Hugues FRANCOIS, 4CAD Solutions Est (c) 2007       #
:#                                                             #
:###############################################################


:------Sauvegarde du code de page : --------

for /f "tokens=5" %%i in ('chcp') do set SavChcp=%%i 

chcp 1252>%TEMP%\nul

if exist search.pro del search.pro

set ct=0

:--------Repérage de la longueur du chemin courant---------


for /f "tokens=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18 delims=\" %%b in ("%CD%") do (

    for %%a in ("%%b" "%%c" "%%d" "%%e" "%%f" "%%g" "%%h" "%%i" "%%j" "%%k" "%%l" "%%m" "%%n" "%%o" "%%p" "%%q" "%%r" "%%s") do call :ct++ %%~a

)


:--------Création du search.pro---------


for /f "tokens=*" %%i in ('dir /b/a:d/s') do (

   for /f "tokens=%ct%,* delims=\" %%a in ("%%i") do (

       echo Ajoute "%%b"&&echo %%b>>search.pro
   )

)

:------Réaffectation du code de page -------

chcp %SavChcp%>%TEMP%\nul

goto :EOF

:ct++

if NOT "%1"=="" set /a ct=ct + 1

goto :EOF
