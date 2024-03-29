#!/bin/bash

if [ -z "$browserstack_username" ]; then
  echo "Please provide your Browserstack Username"
  exit 1
fi

if [ -z "$browserstack_access_key" ]; then
  echo "Please provide your Browserstack Access Key"
  exit 1
fi

if [ -z "$apk_ipa_filepath" ]; then
  echo "Please provide the path for the IPA or APK that you wish to upload."
  echo "For IPA it is usually \$BITRISE_IPA_PATH"
  echo "For APK it is usually \$BITRISE_APK_PATH"
  exit 1
fi

curl -u "$browserstack_username:$browserstack_access_key" -X POST https://api-cloud.browserstack.com/app-live/upload -F "file=@$apk_ipa_filepath"