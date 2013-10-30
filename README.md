# Clearskies Ruboto

This is an android client implementing the [ClearSkies](https://github.com/jewel/clearskies) protocol.

# Setup

Install ruboto (and any dependencies)

After cloning the repo:

    git submodule init
    git submodule update

# Running

Run the daemon on your computer and create a share

    export CLEARSKIES_DIR=/tmp/android_db
    ./clearskies debug
    ./clearskies share /tmp/android_db/ read_write
    SYNCWTOXXXXXXXXX

Put the access code in src/clear_skies_service.rb
