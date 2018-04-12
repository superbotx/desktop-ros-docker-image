# This is an auto generated Dockerfile for ros:ros-core
# generated from docker_images/create_ros_core_image.Dockerfile.em
FROM ubuntu:xenial

# first update anyway
RUN apt-get update

# install lsb_release
RUN apt-get install -y lsb-release

# install pip3
RUN apt-get install -y python3-pip

# instsall pip
RUN apt-get install -y python-pip

# install venv
RUN apt-get install -y python3-venv

# add ros source target
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb-release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# add ros key hash
RUN apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

# update system packages
RUN apt-get update

# install full ros desktop
RUN apt-get install -y ros-kinetic-desktop-full

# search ros packages
RUN apt-cache search ros-kinetic

# initialize ros dependency list and update
RUN rosdep init
RUN rosdep update

# add source into bashrc
RUN echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc

# source bashrc file
RUN /bin/bash -c "source ~/.bashrc"

# install extra ros packages
RUN apt-get install -y python-rosinstall
RUN apt-get install -y python-rosinstall-generator
RUN apt-get install -y python-wstool
RUN apt-get install -y build-essential
