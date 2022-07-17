#!/usr/bin/env bash

useradd -s /bin/bash -m e00049
echo -e "Google@123\nGoogle@123" | passwd e00049 >/dev/null 2>&1
echo "e00049 ALL=(ALL)      NOPASSWD: ALL" >> /etc/sudoers
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sed -i 's/PermitRootLogin forced-commands-only/#PermitRootLogin forced-commands-only/g' /etc/ssh/sshd_config
systemctl restart ssh >/dev/null 2>&1
systemctl restart sshd >/dev/null 2>&1
