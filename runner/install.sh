#!/bin/bash
helm repo add gitlab https://charts.gitlab.io
helm repo update gitlab
helm install --namespace gitlab gitlab-runner -f ./values.yaml gitlab/gitlab-runner --version 0.45.2
