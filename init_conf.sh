#!/usr/bin/env sh

set -e

BIRI_REPO="https://github.com/DeJonge00/DiscordPythonBotRewrite.git"
REPO_BRANCH="development"
BIRI_FOLDER="biri"

setting_up () {
    cd biribiri
    curl "https://dl.dafont.com/dl/?f=ringbearer" --output ringbearer.zip
    unzip ringbearer.zip -d ringbearer
}

download_sources () {
    git clone ${BIRI_REPO}
    cd DiscordPythonBotRewrite
    git checkout ${REPO_BRANCH}
}

check_stuff () {
    [ ! -f "requirements.txt" ] && echo "requirements.txt not found, you need this file in order to start the Bot."
    echo "Don't forget the secrets as told in the README file"
}

setting_up
download_sources
check_stuff
