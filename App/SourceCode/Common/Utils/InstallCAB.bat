@ECHO OFF
Setlocal enabledelayedexpansion
CALL :CounterEachStep %~1
GOTO :installCAB
GOTO :EOF
:installCAB
IF EXIST "!APP_HOME!\Temp\numtemp.db " (
    FOR /F "usebackq delims=" %%a in ("!APP_HOME!\Temp\numtemp.db") DO (
        SET /a num=%%~a
    )
) else (
    SET /a num=1
)
FOR /f "tokens=*" %%g in ('dir /on /b /s "%~1\*.cab"') DO (
    %DISM% /online /add-package /packagepath:"%%g" /NoRestart /Quiet
    FOR /F %%a in ("%%g") DO (
        SET tempname=%%~na
        SET TIP=%~2
        FOR /F "tokens=2 delims=-" %%b in ("!tempname!") DO (
            if "%%~b" EQU "KB2900986" (
                SET "TIP=���ڻ��� %OS_ARCHITECTURE% ��ϵͳ�� Windows 7 �� ActiveX Killbit �ۻ���ȫ���³���"
            )
            if "%%~b" EQU "KB2685811" (
                SET "TIP=�ں�ģʽ���������� 1.11 ����£���������ڻ��� %OS_ARCHITECTURE% ϵͳ�� Windows 7"
            )
            if "%%~b" EQU "KB2685813" (
                SET "TIP=�û�ģʽ���������� 1.11 ����£���������ڻ��� %OS_ARCHITECTURE% ϵͳ�� Windows 7"
            )
            if "%%~b" EQU "KB2670838" (
                SET "TIP=Windows 7 %OS_ARCHITECTURE% Edition ƽ̨���³���"
            )              
            ECHO �ɹ���װ [!num!/!sum!] !TIP! ^(%%~b^)
            SET /a num+=1
        )
    )
)
CALL %APP_HOME%\SourceCode\Common\Utils\MyUtils.bat CleanTemp
GOTO :EOF
::===================================================================================================================
:CounterEachStep
CALL %APP_HOME%\SourceCode\Common\Utils\MyUtils.bat CleanTemp
CALL :SUMALL %~1
GOTO :EOF
::===================================================================================================================
:SUMALL
IF EXIST "!APP_HOME!\Temp\sumtemp.db" (
    FOR /F "usebackq delims=" %%a in ("!APP_HOME!\Temp\sumtemp.db") DO (
        SET /a sum=%%~a
    )
) else (
    SET /a sum=0
)
FOR /f "tokens=*" %%g in ('dir /on /b /s "%~1\*.cab"') DO (
    FOR /F %%a in ("%%g") DO (
        SET sumtempname=%%~na
        FOR /F "tokens=2 delims=-" %%b in ("!sumtempname!") DO (
        SET /a sum+=1
        )
    )
)
ECHO.!sum!>"!APP_HOME!\Temp\sumtemp.db"
GOTO :EOF