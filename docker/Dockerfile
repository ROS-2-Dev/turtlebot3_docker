# ROS distribution to use
ARG ROS_DISTRO=iron

########################################
# Base Image for TurtleBot3 Simulation #
########################################
FROM osrf/ros:${ROS_DISTRO}-desktop as base
ENV ROS_DISTRO=${ROS_DISTRO}
SHELL ["/bin/bash", "-c"]

# Install basic apt packages
RUN apt-get update && apt-get install -y --no-install-recommends \
 git libcanberra-gtk-module libcanberra-gtk3-module fuse3 libfuse2 libqt5svg5-dev \
 python3-pip python3-opencv python3-tk python3-pyqt5.qtwebengine

# Install additional Python modules
RUN pip3 install matplotlib transforms3d

# Use Cyclone DDS as middleware
RUN apt-get update && apt-get install -y --no-install-recommends \
 ros-${ROS_DISTRO}-rmw-cyclonedds-cpp
ENV RMW_IMPLEMENTATION=rmw_cyclonedds_cpp

# Create Colcon workspace with external dependencies
RUN mkdir -p /turtlebot3_ws/src
WORKDIR /turtlebot3_ws/src
COPY dependencies.repos .
RUN vcs import < dependencies.repos

# Build the base Colcon workspace, installing dependencies first.
WORKDIR /turtlebot3_ws
RUN source /opt/ros/${ROS_DISTRO}/setup.bash \
 && apt-get update -y \
 && rosdep install --from-paths src --ignore-src --rosdistro ${ROS_DISTRO} -y \
 && colcon build --symlink-install
ENV TURTLEBOT3_MODEL=waffle_pi

# Remove display warnings
RUN mkdir /tmp/runtime-root
ENV XDG_RUNTIME_DIR "/tmp/runtime-root"
RUN chmod -R 0700 /tmp/runtime-root
ENV NO_AT_BRIDGE 1

# # Set up the entrypoint
WORKDIR /turtlebot3_ws
COPY ./docker/entrypoint.sh /
COPY ./docker/bashrc /home/${USERNAME}/.bashrc
ENTRYPOINT [ "/entrypoint.sh" ]