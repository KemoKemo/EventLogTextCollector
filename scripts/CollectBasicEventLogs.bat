@echo off
setlocal enabledelayedexpansion

rem ���T�v����
rem �e�L�X�g�ŃC�x���g���O���������T���v���B
rem Application�ASystem�ASecurity�̎�v��3�̃��O���������B

rem ���ݒ莖��
set original=
set target=

rem �����̃o�b�`�����݂���t�H���_���J�����g�ɂ��āA�W���o�͂��N���A
pushd %0\..
cls

rem ���{����
call :PreCausion
call :CollectEventLogs
goto :End

rem �Ǘ��Ҏ��s���Ȃ��Ɖ���ł��Ȃ����O������̂ŁA�O�����Čx��
:PreCausion
echo.
echo ****
echo You need execute as an Administrator to collect the Security event logs.
echo ****
echo.
exit /b

rem ��v3�̃C�x���g���O��csv�t�@�C���ŉ��
:CollectEventLogs
cscript DumpEventLog.vbs 127.0.0.1 Application.csv "Application"
cscript DumpEventLog.vbs 127.0.0.1 System.csv "System"
cscript DumpEventLog.vbs 127.0.0.1 Security.csv "Security"
exit /b

:End

endlocal
pause
exit