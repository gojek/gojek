#!/usr/bin/env bash

git config --global user.email "${GITHUB_EMAIL}" > /dev/null 2>&1
git config --global user.name "${GITHUB_NAME}" > /dev/null 2>&1

cat >> ~/.ssh/config << EOF
VerifyHostKeyDNS yes
StrictHostKeyChecking no
EOF
