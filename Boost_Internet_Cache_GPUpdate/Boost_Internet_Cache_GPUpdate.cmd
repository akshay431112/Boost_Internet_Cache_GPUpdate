@echo off
color 0A
title Boost Internet Speed, Clear Cache, Update Group Policy

echo.
echo ====== Boosting Internet Speed | Cleaning Cache | Updating Group Policy ======
echo.

:: Step 1: Flush DNS
echo ➤ Flushing DNS...
ipconfig /flushdns

:: Step 2: Reset Winsock
echo ➤ Resetting Winsock...
netsh winsock reset

:: Step 3: Renew IP address
echo ➤ Releasing and renewing IP...
ipconfig /release
ipconfig /renew

:: Step 4: Delete temp files
echo ➤ Deleting temporary files...
del /q /f /s "%TEMP%\*.*" >nul 2>&1
del /q /f /s "C:\Windows\Temp\*.*" >nul 2>&1

:: Step 5: Clear Chrome Cache (keep passwords & bookmarks)
echo ➤ Clearing Chrome cache...
rd /s /q "%LocalAppData%\Google\Chrome\User Data\Default\Cache"
rd /s /q "%LocalAppData%\Google\Chrome\User Data\Default\Code Cache"
del /q "%LocalAppData%\Google\Chrome\User Data\Default\Network\*.*" >nul 2>&1
del /q "%LocalAppData%\Google\Chrome\User Data\Default\History Provider Cache" >nul 2>&1

:: Step 6: Clear Microsoft Edge Cache (keep passwords & bookmarks)
echo ➤ Clearing Edge cache...
rd /s /q "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache"
rd /s /q "%LocalAppData%\Microsoft\Edge\User Data\Default\Code Cache"
del /q "%LocalAppData%\Microsoft\Edge\User Data\Default\Network\*.*" >nul 2>&1

:: Step 7: Clear prefetch (optional)
echo ➤ Clearing Prefetch (optional)...
del /q /f /s "C:\Windows\Prefetch\*.*" >nul 2>&1

:: Step 8: Force Group Policy Update
echo ➤ Updating Group Policy...
gpupdate /force

echo.
echo ✅ All tasks completed successfully.
echo You may reboot the system for full effect of Winsock and Group Policy updates.
pause
