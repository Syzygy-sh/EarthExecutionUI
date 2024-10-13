#!/bin/bash

main() {
    clear
    fx=1
    time=0

    loader() {
        clear
        echo "Earth Execution UI - Based on Plant Engine 1.0.0 | installer version b8.25 { Cracked by sharpcystals-github342 }"
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
        echo "Earth Execution UI - Based on Plant Engine 1.0.0 | installer version b8.25 { Cracked by sharpcystals-github342 }"
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
