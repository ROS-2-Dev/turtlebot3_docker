#!/bin/bash
# Basic entrypoint for ROS / Colcon Docker containers
set -e

# setup ros2 environment
source /opt/ros/iron/setup.bash
echo 'source "/opt/ros/iron/setup.bash"' >> ~/.bashrc

# fix Gazebo display
source /usr/share/gazebo/setup.sh

# Source the base workspace, if built
if [ -f /turtlebot3_ws/install/setup.bash ]
then
  source /turtlebot3_ws/install/setup.bash
  export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:$(ros2 pkg prefix turtlebot3_gazebo)/share/turtlebot3_gazebo/models
  echo "Sourced TurtleBot3 base workspace"
fi

# Source the overlay workspace, if built
if [ -f /overlay_ws/install/setup.bash ]
then
  source /overlay_ws/install/setup.bash
  echo "Sourced autonomy overlay workspace"
fi

# Execute the command passed into this entrypoint
exec "$@"
