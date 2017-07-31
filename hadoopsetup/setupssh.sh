#!/bin/sh

echo -ne '\n\n' | ssh-keygen -t rsa -P ""
cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
