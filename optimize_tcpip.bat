@echo off
:: This batch file optimizes TCP/IP settings for better network performance in Windows 10.

:: Title of the script
title TCP/IP Optimization Script

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

:: Disable Windows Scaling Heuristics
echo Disabling Windows Scaling Heuristics...
netsh interface tcp set heuristics disabled

:: Enable TCP Window Auto-Tuning Level
echo Enabling TCP Window Auto-Tuning Level...
netsh interface tcp set global autotuninglevel=normal

:: Enable ECN Capability
echo Enabling ECN Capability...
netsh interface tcp set global ecncapability=enabled

:: Enable RFC 1323 Timestamps
echo Enabling RFC 1323 Timestamps...
netsh int tcp set global timestamps=enabled

:: Set Initial RTO to 1000 milliseconds (1 second)
echo Setting Initial RTO to 1000 milliseconds...
netsh interface tcp set global initialRto=1000

:: Enable Receive Segment Coalescing (RSC)
echo Enabling Receive Segment Coalescing (RSC)...
netsh interface tcp set global rsc=enabled

:: Disable Non Sack RTT Resiliency
echo Disabling Non Sack RTT Resiliency...
netsh int tcp set global nonsackrttresiliency=disabled

:: Increase TCP Max Syn Retransmissions
echo Increasing TCP Max Syn Retransmissions...
netsh interface tcp set global maxsynretransmissions=2

:: Enable TCP Fast Open
echo Enabling TCP Fast Open...
netsh int tcp set global fastopen=enabled

:: Enable TCP Fast Open Fallback
echo Enabling TCP Fast Open Fallback...
netsh int tcp set global fastopenfallback=enabled

:: Enable HyStart
echo Enabling HyStart...
netsh int tcp set global hystart=enabled

:: Enable Proportional Rate Reduction (PRR)
echo Enabling Proportional Rate Reduction (PRR)...
netsh int tcp set global prr=enabled

:: Disable Pacing Profile
echo Disabling Pacing Profile...
netsh int tcp set global pacingprofile=off

:: Enable Receive-Side Scaling (RSS)
echo Enabling Receive-Side Scaling (RSS)...
netsh int tcp set global rss=enabled

:: Display the current TCP/IP settings
echo Displaying current TCP/IP settings...
netsh int tcp show global

:: Script completion message
echo TCP/IP optimization completed successfully.
pause
