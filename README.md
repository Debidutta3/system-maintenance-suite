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
system-maintenance-suite/
│
├── backup.sh # Automated backup script
├── update_cleanup.sh # System update + cleanup script
├── log_monitor.sh # Log monitoring and alert script
├── maintenance_suite.sh # MENU: Runs all scripts
└── README.md # Project documentation


---

## 🧠 **Why I Built This**

Before automation, I had to manually run commands like:

sudo apt update && sudo apt upgrade
tar -czvf backup.tar.gz /home /etc
grep error /var/log/syslog


Now all I do is:

sudo ./maintenance_suite.sh

Pick an option → **Done.**

This saves time, avoids mistakes, and increases productivity.

---

## ⚙️ **How to Run This Project**

```bash
Step 1: Clone Repository**
git clone <https://github.com/Debidutta3/system-maintenance-suite>
cd system-maintenance-suite
Step 2: Make Scripts Executable
chmod +x *.sh
Step 3: Run the Menu Script
sudo ./maintenance_suite.sh
```

## 🧠 What I Learned

This project helped me understand:

Bash scripting fundamentals

Using loops, functions, conditions, and pattern matching

Implementing logging and error handling

Automating tasks like system backup and update

Organizing a project and pushing to GitHub

This project gave me a taste of what DevOps engineers do daily.

## ✅ Conclusion

This automation suite makes system maintenance:

Faster

Error-free

User-friendly
