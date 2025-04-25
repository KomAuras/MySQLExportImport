@echo off
rem ���������� ��� ����� ��� � ����
mysql -uroot -e "SHOW DATABASES;" > tempos1.tmp
rem ���������� EOL CR �� CRLF
type tempos1.tmp | find /v "" > tempos2.tmp
del /q tempos1.tmp
rem ������� �� ����� ��������� ����
findstr /V /R /I "^Database$ ^information_schema$ ^sys$ ^performance_schema$ ^mysql$" tempos2.tmp > tempos3.tmp
del /q tempos2.tmp
rem ������������ ��� ���������� ����
for /F "tokens=*" %%A in (tempos3.tmp) do mysqldump -v -uroot --databases %%A > %%A.sql
del /q tempos3.tmp
