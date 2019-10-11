#! /bin/bash

export UNITY_JSON=$(curl -s "https://public-cdn.cloud.unity3d.com/hub/prod/releases-${UNITY_PLATFORM}.json")
export UNITY_VERSION_JSON=$(echo $UNITY_JSON | jq -r --arg VERSION "$UNITY_VERSION" '.official[] | select( .version | contains($VERSION))')
export UNITY_VERSION_FULL=$(echo $UNITY_VERSION_JSON | jq -r '.version')
