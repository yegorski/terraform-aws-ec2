#!/bin/bash

# Fail on error
set -e

# Install common tooling
yum install -y \
    bash-completion \
    bash-completion-extras \
    bind-utils \
    nfs-utils \
    vim
