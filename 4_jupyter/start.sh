#!/bin/sh
cd /notebooks
jupyter notebook --no-browser --ip=`hostname -i` --allow-root
