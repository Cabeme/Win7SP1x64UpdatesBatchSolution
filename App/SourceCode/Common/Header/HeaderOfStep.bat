@ECHO OFF
SET step=%~1
SET /a col=%~2 
SET /a line=%~3 
Title ��%step%�׶γɹ���ϵͳ����������,�Զ�������һ�׶εİ�װ.
mode con cols=%col% lines=%line%
Color 1F
taskkill /IM sysprep.exe /F >nul 2>&1
ECHO ��װ���Ͽ�ʼ,���Ժ�...
ECHO.
GOTO :EOF