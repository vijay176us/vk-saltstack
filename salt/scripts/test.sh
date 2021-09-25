#!/bin/bash

sudo echo 'Hello Wolrd!'
sum=$(expr 2 + 2)
sudo touch /tmp/test
sudo echo 'The sum is :',$sum > /tmp/test
