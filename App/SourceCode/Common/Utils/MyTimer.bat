@ECHO OFF
color 3F
mode con:cols=65 lines=6
SET count=%~10
CALL :Timer
GOTO :EOF
:Timer
IF NOT %count% == -1 (
    cls
    IF %count% == 0 (
        ECHO.
        ECHO     ϵͳ������������ !!!
        ECHO.
    ) ELSE (
        ECHO.
        ECHO     ϵͳ���� %count% �����������,�Զ���ʼ��һ�׶εİ�װ
        ECHO.
        ECHO     ����������������,�������رձ����� !!!         
    )
    SET /A count=%count% - 1
    ping localhost -n 2 >nul
    GOTO Timer
)
GOTO :EOF