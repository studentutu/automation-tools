#! /bin/bash

gpg --quiet --batch --yes --decrypt --passphrase="$GPG_PASSPHRASE" --output ./Unity.ulf ./Unity.ulf.gpg
unity -quit -batchmode -nographics -logfile -manualLicenseFile Unity.ulf || true
