@echo off
rem ������� ���� � ������ ��� � ������ sql � ������� �����
for /f %%a in ('dir /b .\*.sql') do mysql.exe -uroot -e "CREATE DATABASE IF NOT EXISTS %%~na"
rem ������ � ���� �����
for /f %%a in ('dir /b .\*.sql') do mysql.exe -uroot %%~na  < %%~na.sql
