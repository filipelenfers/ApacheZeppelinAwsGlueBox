#!/bin/sh

#THIS SCRIPT EXPECTS THAT YOU ALREADY HAVE A BOX IN APP.VAGRANTUP.COM

USER=$1 #your user at app.vagrantup.com
BOX_NAME=$2 #your box at app.vagrantup.com
VERSION=$3 #version you want to publish
VAGRANT_CLOUD_TOKEN=$4 #your token generated at app.vagrantup.com user settings

echo "Genereting box..."
#generate build
vagrant package --output build/zeppelinGlue.box --vagrantfile templates/Vagrantfile_Template_Box --include ./scripts/startZeppelin.sh,./scripts/stopZeppelin.sh
echo "Done."

echo "Genereting new version..."
#create new version
curl \
  --header "Content-Type: application/json" \
  --header "Authorization: Bearer $VAGRANT_CLOUD_TOKEN" \
  https://app.vagrantup.com/api/v1/box/$USER/$BOX_NAME/versions \
  --data '{ "version": { "version": "$VERSION" } }'

echo "Genereting provider..."
# Create a new provider
curl \
  --header "Content-Type: application/json" \
  --header "Authorization: Bearer $VAGRANT_CLOUD_TOKEN" \
  https://app.vagrantup.com/api/v1/box/myuser/$USER/$BOX_NAME/$VERSION/providers \
  --data '{ "provider": { "name": "virtualbox" } }'

echo "Uploaging file..."
# Prepare the provider for upload/get an upload URL
response=$(curl \
  --header "Authorization: Bearer $VAGRANT_CLOUD_TOKEN" \
  https://app.vagrantup.com/api/v1/box/$USER/$BOX_NAME/version/$VERSION/provider/virtualbox/upload)

# Extract the upload URL from the response (requires the jq command)
upload_path=$(echo "$response" | jq .upload_path)

# Perform the upload
curl $upload_path --request PUT --upload-file build/zeppelinGlue/package.box

echo "Releasing version..."
# Release the version
curl \
  --header "Authorization: Bearer $VAGRANT_CLOUD_TOKEN" \
  https://app.vagrantup.com/api/v1/box/$USER/$BOX_NAME/version/$VERSION/release \
  --request PUT

echo "Done!"