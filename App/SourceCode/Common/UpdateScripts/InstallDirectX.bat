@ECHO OFF & PUSHD %~DP0
mode con:cols=94 lines=42
SET DX_HOME=%APP_HOME%\Updates\Runtimes\DirectX
SET SUCCESSTIPS=��װ  ΢��DirectX9.0c�����û����п�
ECHO.
ECHO                      ---------------------------------------------------
ECHO                            ΢��DirectX9.0c�����û����п� ��װ��
ECHO                      ---------------------------------------------------
ECHO.
IF NOT EXIST "%WINDIR%\System32\d3dx11_43.dll" (
    ECHO.
    ECHO ����%SUCCESSTIPS%
    ECHO.
    "%DX_HOME%\DXSETUP.exe" /silent
    ECHO.
    ECHO �ɹ�%SUCCESSTIPS%
    ECHO.
) ELSE (
    ECHO.
    ECHO.
    ECHO.
    ECHO.
    ECHO.
    ECHO.
    ECHO.
    ECHO.
    ECHO.
    ECHO.
    ECHO.
    ECHO.
    ECHO.  
    ECHO                        ΢��DirectX9.0c�����û����п��Ѱ�װ,�������°�װ...
    ECHO.  
    ECHO.
)
GOTO :EOF

echo                        ---------------------------------------------------
echo                          Microsoft Visual C++[2005-2017]���п� ��װ��
echo                        ---------------------------------------------------
echo.