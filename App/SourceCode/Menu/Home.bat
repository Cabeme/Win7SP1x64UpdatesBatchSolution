@ECHO OFF&PUSHD %~DP0
CALL "%APP_HOME%\SourceCode\Common\Header\HeaderOfIndex.bat"
SetLocal EnableDelayedExpansion
if defined %~1 GOTO %~1 else GOTO :HomePage
:HomePage
mode con:cols=94 lines=42
Color 1F
SET input=null
cls
CALL "%APP_HOME%\SourceCode\Common\Utils\MyUtils.bat" DisplayAppName
ECHO. *                                                                                          *
ECHO. *                                                                                          *
ECHO. *                                                                                          *
ECHO  *                                 1.��װ���µ���ǰϵͳ��                                   *
ECHO  *                                                                                          *
ECHO. *         ע�������ʹ�ùٷ�����װ�õ�ϵͳ��,��δ��װ�������ǰ���б�����                *
ECHO  *                                                                                          *
ECHO. *                                                                                          *
ECHO. *                                                                                          *
ECHO  ********************************************************************************************
ECHO. *                                                                                          *
ECHO. *                                                                                          *
ECHO. *                                                                                          *
ECHO  *                                 2.��װ���µ��ٷ�������                                   *
ECHO. *                                                                                          *
ECHO. *                    ע�������¼��ɵ�Win7SP1%OS_ARCHITECTURE%�������Ĺٷ�ԭ�澵����                      *
ECHO. *                                                                                          *
ECHO  *          �� �ù��ܲ�֧��Ghost��,�����,�̻����°�ȵ������������޸İ�ϵͳ                *
ECHO. *                                                                                          *
ECHO. *                                                                                          *
ECHO. *                                                                                          *
ECHO  ********************************************************************************************
ECHO. *                                                                                          *
ECHO. *  ע��������������%LastUpdateDate%��ǰ΢���������б�Ҫ��δ������Ĺٷ�����, ��δ�������¸���: *
ECHO  *                                                                                          *
ECHO  *  ��  KB2952664 : ������ Windows 10 �ļ����Ը���                                          *
ECHO  *  ��  KB3021917 : ���� Windows �ͻ�������Ƽƻ� (CEIP),����������ͻ� Microsoft��       *
ECHO  *  ��  KB3068708 : ���� Windows �ͻ�������Ƽƻ� (CEIP),����������ͻ� Microsoft��       *
ECHO  *  ��  KB3080149 : ���� Windows �ͻ�������Ƽƻ� (CEIP),����������ͻ� Microsoft��       *
ECHO  *  ��  ÿ����Ѯ������Ԥ�����ѡ����                                                        *
ECHO. *                                                                                          *
ECHO  ********************************************************************************************
ECHO.
SET /p input=  ��������Ҫѡ�������:
IF "%input%"=="1" (Goto H1)
IF "%input%"=="2" (Goto H2)
if %input% GTR 2 (
    ECHO.
    ECHO ������һ����Ч������
)
ECHO.
PAUSE
cls
GOTO HomePage
:H1
CALL "%APP_HOME%\SourceCode\Menu\UpdateWindowsFromLocalDrive.bat"
GOTO :EOF

:H2
CALL "%APP_HOME%\SourceCode\Menu\BuildNewISOWithUpdates.bat" ISOMenu
GOTO :EOF