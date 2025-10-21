# turtbot3 docker simulation

## Reference

https://github.com/sea-bass/turtlebot3_behavior_demos

## Setup

    git clone git@github.com:ROS-2-Dev/turtlebot3_docker.git
    cd turtlebot3_docker

ROS_DISTRO can be set in the command, but not necessary work on all distros. Better create/change to specific ROS distro branch.
    
    ROS_DISTRO=iron docker compose build

## usage

    docker compose up tb3_nav
will run the turtlebot3 simulation with navigation stack and rosweb-bridge @http://localhost:9090/

## development in docker container
    docker compose up dev
start the development docker container.

    docker compose exec -it dev bash
attach to the running development container.
