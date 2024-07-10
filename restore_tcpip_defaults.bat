@echo off
:: This batch file restores TCP/IP settings to their default values in Windows 10.

:: Title of the script
title Restore Default TCP/IP Settings

:: Requesting administrative privileges
echo Requesting administrative privileges...
cd /d %~dp0
if "%1"=="" (
    echo Set UAC for this script...
    powershell start-process '%0' -ArgumentList 'elevated' -Verb runAs
    exit
) else (
    if "%1"=="elevated" shift /1
)

:: Enable Windows Scaling Heuristics
echo Enabling Windows Scaling Heuristics...
netsh interface tcp set heuristics enabled

:: Set TCP Window Auto-Tuning Level to default
echo Setting TCP Window Auto-Tuning Level to default...
netsh interface tcp set global autotuninglevel=disabled

:: Disable ECN Capability
echo Disabling ECN Capability...
netsh interface tcp set global ecncapability=disabled

:: Disable RFC 1323 Timestamps
echo Disabling RFC 1323 Timestamps...
netsh int tcp set global timestamps=disabled

:: Set Initial RTO to default (3000 milliseconds)
echo Setting Initial RTO to default (3000 milliseconds)...
netsh interface tcp set global initialRto=3000

:: Disable Receive Segment Coalescing (RSC)
echo Disabling Receive Segment Coalescing (RSC)...
netsh interface tcp set global rsc=disabled

:: Enable Non Sack RTT Resiliency
echo Enabling Non Sack RTT Resiliency...
netsh int tcp set global nonsackrttresiliency=enabled

:: Set TCP Max Syn Retransmissions to default (2)
echo Setting TCP Max Syn Retransmissions to default (2)...
netsh interface tcp set global maxsynretransmissions=2

:: Disable TCP Fast Open
echo Disabling TCP Fast Open...
netsh int tcp set global fastopen=disabled

:: Disable TCP Fast Open Fallback
echo Disabling TCP Fast Open Fallback...
netsh int tcp set global fastopenfallback=disabled

:: Disable HyStart
echo Disabling HyStart...
netsh int tcp set global hystart=disabled

:: Disable Proportional Rate Reduction (PRR)
echo Disabling Proportional Rate Reduction (PRR)...
netsh int tcp set global prr=disabled

:: Enable Pacing Profile
echo Enabling Pacing Profile...
netsh int tcp set global pacingprofile=enabled

:: Enable Receive-Side Scaling (RSS)
echo Enabling Receive-Side Scaling (RSS)...
netsh int tcp set global rss=enabled

:: Display the current TCP/IP settings
echo Displaying current TCP/IP settings...
netsh int tcp show global

:: Script completion message
echo Default TCP/IP settings restored successfully.
pause
