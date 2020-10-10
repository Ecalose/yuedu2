#!/bin/sh

function set_env() { echo "$1=$2" >> $GITHUB_ENV; }

APP_NAME='MyBookshelf'
APP_GIT_URL='https://github.com/gedoor/MyBookshelf.git'
APP_SUFFIX="A"
if [ $SECRETS_ENABLE = 'true' ] && [ -n "$SECRETS_APP_NAME" ] && [ -n "$SECRETS_GIT_URL" ]; then
    APP_NAME=$SECRETS_APP_NAME
    APP_GIT_URL=$SECRETS_GIT_URL
fi
APP_WORKSPACE="/opt/$APP_NAME"
APP_LATEST_TAG='latest'
APP_UPLOAD_NAME="$APP_NAME-$APP_LATEST_TAG"
APP_UPLOAD="$APP_WORKSPACE/app/build/outputs/apk/app/release"

set_env APP_NAME        $APP_NAME
set_env APP_WORKSPACE   $APP_WORKSPACE
set_env APP_SUFFIX      $APP_SUFFIX
set_env APP_GIT_URL     $APP_GIT_URL
set_env APP_UPLOAD_NAME $APP_UPLOAD_NAME
set_env APP_UPLOAD      $APP_UPLOAD
set_env SECRETS_MINIFY  $SECRETS_MINIFY
set_env SECRETS_TAG     $SECRETS_TAG

