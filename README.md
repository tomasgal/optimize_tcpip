# TCP/IP Optimization Scripts for Windows 10

This repository contains batch scripts to optimize and restore TCP/IP settings for better network performance on Windows 10.

## Files

- **optimize_tcpip.bat**: A script to optimize TCP/IP settings.
- **restore_tcpip_defaults.bat**: A script to restore TCP/IP settings to their default values.

## Requirements

- Windows 10
- Administrative privileges

## Backup Current Settings

Before making any changes, it's recommended to backup your current TCP/IP settings. You can do this by running the following command in Command Prompt:

```sh
netsh int tcp show global > tcp_settings_backup.txt
