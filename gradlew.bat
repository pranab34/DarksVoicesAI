@echo off
where gradle >nul 2>nul
if %ERRORLEVEL% EQU 0 ( gradle %* & exit /b %ERRORLEVEL% )
echo Gradle 8.9 is required. Install/provision Gradle 8.9, then rerun.
exit /b 1
