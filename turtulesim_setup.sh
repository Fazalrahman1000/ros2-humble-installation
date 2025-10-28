#!/bin/bash
# turtlesim_full_setup.sh
# Installs and runs Turtlesim with teleop in a second terminal

set -e  # Stop if any command fails

# Default to ROS 2 Humble if not set
ROS_DISTRO=${ROS_DISTRO:-humble}

echo "🐢 Updating packages..."
sudo apt update -y

echo "📦 Installing Turtlesim for ROS 2 $ROS_DISTRO..."
sudo apt install -y ros-$ROS_DISTRO-turtlesim

echo "✅ Turtlesim installed successfully!"

# Source ROS 2 setup
source /opt/ros/$ROS_DISTRO/setup.bash

echo "🚀 Launching Turtlesim node..."
# Start turtlesim_node in a new terminal
gnome-terminal -- bash -c "
echo '🟢 Running turtlesim_node...';
source /opt/ros/$ROS_DISTRO/setup.bash;
ros2 run turtlesim turtlesim_node;
exec bash
"

# Give turtlesim a moment to start
sleep 2

echo "🎮 Launching teleop controller..."
# Start turtle_teleop_key in another terminal
gnome-terminal -- bash -c "
echo '🎮 Running turtle_teleop_key...';
source /opt/ros/$ROS_DISTRO/setup.bash;
ros2 run turtlesim turtle_teleop_key;
exec bash
"

echo "✅ Both nodes launched in separate terminals!"

