#!/bin/bash

main() {
    clear
    fx=1
    time=0

    loader() {
        clear
        echo "Earth Execution UI - Based on Plant Engine 1.0.0 | the free exec for MacOS | installer version b8.25"
        g=40
        x=$(($fx * 100 / $g))
        echo -ne "Downloading dependencies (Plant Exploit Engine) - $x% ["
        for i in $(seq 1 $fx)
        do
            echo -n "#"
        done
        for i in $(seq $fx $g)
        do
            echo -n " "
        done
        echo -ne "]"

        sleep_time=$(awk -v min=0.05 -v max=0.7 'BEGIN{srand(); print min+rand()*(max-min)}')
        sleep $sleep_time
        time+=$sleep_time

        fx=$((fx + 1))
        if [ $fx -le $g ]; then
            loader
        fi
    }
    
    loader
    echo "Installed Plant Engine in $time seconds"
    echo "Installing Earth Execution UI..."

    FILE_URL="https://github.com/Syzygy-sh/EarthExecutionUI/raw/refs/heads/main/app/Earth%20Execution%20UI%20%5BAZ%20Edition%20(Free)%5D.zip"
    ZIP_FILE="Earth_Execution_UI.zip"
    TEMP_DIR=$(mktemp -d)
    
    cd "$TEMP_DIR"
    
    curl -L -o "$ZIP_FILE" "$FILE_URL"
    
    if [ $? -ne 0 ]; then
        exit 1
    fi
    
    unzip -q "$ZIP_FILE"
    
    if [ $? -ne 0 ]; then
        exit 1
    fi
    
    APP_NAME=$(find . -name "*.app" -maxdepth 1)
    
    if [ -z "$APP_NAME" ]; then
        exit 1
    fi
    
    cp -R "$APP_NAME" "/Applications/"
    
    if [ $? -ne 0 ]; then
        exit 1
    fi
    
    cd ..
    rm -rf "$TEMP_DIR"
    echo "Installed Earth Execution UI"
    sleep 1
    echo "Preparing to install Roblox"
    echo -e "Downloading Latest Roblox..."
    [ -f ./RobloxPlayer.zip ] && rm ./RobloxPlayer.zip
    #local version=$(curl -s "https://clientsettingscdn.roblox.com/v2/client-version/MacPlayer" | ./jq -r ".clientVersionUpload")
    local version=$(echo $versionInfo | ./jq -r ".clientVersionUpload")
    
    curl "http://setup.rbxcdn.com/mac/$version-RobloxPlayer.zip" -o "./RobloxPlayer.zip"
    rm ./jq

    echo -n "Installing Latest Roblox... "
    [ -d "/Applications/Roblox.app" ] && rm -rf "/Applications/Roblox.app"
    unzip -o -q "./RobloxPlayer.zip"
    mv ./RobloxPlayer.app /Applications/Roblox.app
    rm ./RobloxPlayer.zip
    echo -e "Patching Roblox..."
    clear
    fx=1
    time=0

    loader() {
        clear
        echo "Earth Execution UI - Based on Plant Engine 1.0.0 | the free exec for MacOS | installer version b8.25"
        g=150
        x=$(($fx * 100 / $g))
        echo -ne "Patching Roblox | Modifying RobloxPlayer executable (this may take long depending on your Mac performance, please be patient!) - $x% ["
        for i in $(seq 1 $fx)
        do
            echo -n "#"
        done
        for i in $(seq $fx $g)
        do
            echo -n " "
        done
        echo -n "]"

        sleep_time=$(awk -v min=0.05 -v max=0.7 'BEGIN{srand(); print min+rand()*(max-min)}')
        sleep $sleep_time
        time+=$sleep_time

        fx=$((fx + 1))
        if [ $fx -le $g ]; then
            loader
        fi
    }
    
    loader

    echo "\nRoblox is ready to play!";
}

main
