# 🚀 ROS 2 Humble Installation on Ubuntu 22.04

This guide will help you install **ROS 2 Humble** on Ubuntu 22.04 using an automated installation script.  

---

## 📋 Prerequisites

Before starting, ensure you have:

- Ubuntu 22.04 installed  
- Internet connection  
- Terminal access  
- `sudo` privileges
- 
  [For ubuntu and related packages and tools installation guidence see](https://ubuntu.com/tutorials/install-ubuntu-desktop#1-overview)
---

## ⚙️ Step 0: Download the Installation Script

Clone the repository and navigate to it:

```bash
git clone https://github.com/Fazalrahman1000/ros2-humble-installation.git
cd ros2-humble-installation

```


# Make this file executable
```bash
chmod +x installation.sh
```

# Run the Installation file script

```bash
./installation.sh

```
# Uninstall ROS2
#### If you need to uninstall ROS 2 or switch to a source-based install once you have already installed from binaries, run the following command:
```bash
sudo apt remove ~nros-humble-* && sudo apt autoremove
```
#### You may also want to remove the repository:

```bash
sudo apt remove ros2-apt-source
sudo apt update
sudo apt autoremove
sudo apt upgrade # Consider upgrading for packages previously shadowed.
```

# Installation of turtlesim from single file

- after clone the repository, you will the see the turtulesim_setup.sh file in your local machine.
- make it executable with ```bash  chmod +x turtulesim_setup.sh  ``` and run it.
- this must be after installing ros2.


### For more deep guidence
(https://docs.ros.org/en/humble/)

# Thank You
