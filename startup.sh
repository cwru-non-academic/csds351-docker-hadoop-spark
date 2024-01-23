#!/bin/bash

echo "Setting root password..."
expect /root_password.exp

echo "Starting SSH daemon..."
service ssh start

echo "Starting Hadoop services..."
hdfs namenode -format
start-dfs.sh
start-yarn.sh

echo "Setting Jupyter password..."
expect /jupyter_password.exp

echo "Starting Jupyter..."
jupyter notebook --allow-root --ip=0.0.0.0 