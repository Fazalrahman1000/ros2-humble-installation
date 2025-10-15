#!/bin/bash
# ============================================================
#  ROS 2 Humble Installation Script (Ubuntu 22.04)
#  Author: [Your Name]
#  Usage:
#      chmod +x installation.sh
#      ./installation.sh
# ============================================================

set -e  # stop if any command fails

echo "=============================================="
echo "     Installing ROS 2 Humble (Ubuntu 22.04)"
echo "=============================================="

# 1. Set locale
echo "[1/9] Setting locale..."
sudo apt update -y
sudo apt install -y locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

# 2. Enable universe repository
echo "[2/9] Enabling Universe repository..."
sudo apt install -y software-properties-common
sudo add-apt-repository universe -y

# 3. Add ROS 2 GPG key
echo "[3/9] Adding ROS 2 GPG key..."
sudo apt install -y curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key | sudo tee /etc/apt/keyrings/ros-archive-keyring.gpg >/dev/null

# 4. Add ROS 2 repository
echo "[4/9] Adding ROS 2 repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | \
  sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

# 5. Update package index
echo "[5/9] Updating package index..."
sudo apt update -y

# 6. Install ROS 2 Humble Desktop
echo "[6/9] Installing ROS 2 Humble Desktop..."
sudo apt install -y ros-humble-desktop

# 7. Environment setup
echo "[7/9] Setting up environment..."
source /opt/ros/humble/setup.bash
if ! grep -Fxq "source /opt/ros/humble/setup.bash" ~/.bashrc
then
    echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
fi

# 8. Install development tools
echo "[8/9] Installing colcon, rosdep, and other tools..."
sudo apt install -y python3-colcon-common-extensions python3-rosdep python3-argcomplete build-essential

# 9. Initialize rosdep
echo "[9/9] Initializing rosdep..."
sudo rosdep init || true
rosdep update

echo ""
echo "=============================================="
echo " ✅ ROS 2 Humble installation complete!"
echo "    Open a new terminal or run:"
echo "        source ~/.bashrc"
echo "=============================================="

