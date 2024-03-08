# turtbot3 docker simulation

## Setup

    git clone git@github.com:ROS-2-Dev/turtlebot3_docker.git
    cd turtlebot3_docker
    docker compose build

## usage

    docker compose up tb3_nav
will run the turtlebot3 simulation with navigation stack.

## development in docker container
    docker compose up dev
start the development docker container.

    docker compose exec -it dev bash
attach to the running development container.
