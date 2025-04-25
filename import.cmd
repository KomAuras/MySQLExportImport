@echo off
rem создаем базы с именем как у файлов sql в текущей папке
for /f %%a in ('dir /b .\*.sql') do mysql.exe -uroot -e "CREATE DATABASE IF NOT EXISTS %%~na"
rem грузим в базы файлы
for /f %%a in ('dir /b .\*.sql') do mysql.exe -uroot %%~na  < %%~na.sql
