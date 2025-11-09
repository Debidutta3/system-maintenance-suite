# system-maintenance-suite
# 🛠️ **System Maintenance Automation Suite (Bash Scripting Project)**

---

## 👤 **Developer Information**
**Name:** *Debi Dutta Dash*  
**Registration No:** *2241004157*  
**Batch:** *12*

---

## 📌 **Project Overview**

Managing a Linux system often requires several repetitive terminal commands:

- Backing up system files
- Updating software packages
- Cleaning unused dependencies
- Monitoring log files for errors

To simplify this, I created a **Bash Script Automation Suite** that performs all these tasks through a **single interactive menu**.

> Instead of typing 6–7 commands, I now type only one.

---

## ✨ **Key Features**

| Script Name | Functionality |
|------------|---------------|
| `backup.sh` | Creates compressed backups of important directories (`/home` and `/etc`) and deletes backups older than 7 days. |
| `update_cleanup.sh` | Updates system packages, upgrades installed apps, and performs cleanup (autoremove & autoclean). |
| `log_monitor.sh` | Monitors `/var/log/syslog` for critical keywords like `error`, `failed`, `critical`, or `unauthorized`. |
| `maintenance_suite.sh` | Provides a **menu-driven interface** to run all the above scripts with one click. |

All scripts have:
✅ Error handling  
✅ Centralized logging (`/var/log/system_maintenance.log`)  
✅ Clean and readable outputs  

---

## 📂 **Project Structure**

