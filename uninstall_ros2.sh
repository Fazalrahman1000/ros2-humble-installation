#!/bin/bash
# ============================================================
#  ROS 2 Humble Uninstallation Script (Ubuntu 22.04)
#  Author: [Your Name]
#  Usage:
#      chmod +x uninstall_ros2.sh
#      ./uninstall_ros2.sh
# ============================================================

set -e  # Stop on any command failure

echo "=============================================="
echo "     Uninstalling ROS 2 Humble (Ubuntu 22.04)"
echo "=============================================="

# 1. Remove ROS 2 packages
echo "[1/5] Removing ROS 2 Humble packages..."
sudo apt remove -y ~nros-humble-* 
sudo apt autoremove -y

# 2. Remove ROS 2 repository if exists
echo "[2/5] Removing ROS 2 repository..."
sudo rm -f /etc/apt/sources.list.d/ros2.list
sudo apt remove -y ros2-apt-source || true
sudo apt update -y

# 3. Autoremove any remaining dependencies
echo "[3/5] Cleaning up unnecessary packages..."
sudo apt autoremove -y
sudo apt upgrade -y

# 4. Remove environment setup from bashrc
echo "[4/5] Removing ROS 2 environment variables from ~/.bashrc..."
sed -i '/source \/opt\/ros\/humble\/setup.bash/d' ~/.bashrc

# 5. Done
echo ""
echo "=============================================="
echo " ✅ ROS 2 Humble uninstallation complete!"
echo "    Restart your terminal session to apply changes."
echo "=============================================="

