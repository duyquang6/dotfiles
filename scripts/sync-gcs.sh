#!/bin/bash

# Default values
DEST_PATH="gs://ligt-docker/vm"
SOURCE_PATH="."
INTERVAL=10

# Function to display usage
usage() {
    echo "Usage: $0 --dest=<destination_path> [--source=<gcs_bucket>]"
    echo "Example: $0 --dest=/airflow/gcs"
    echo "         $0 --dest=/my/path --source=gs://my-bucket"
    exit 1
}

# Parse named parameters
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --dest=*) DEST_PATH="${1#*=}"; shift ;;
        --source=*) SOURCE_PATH="${1#*=}"; shift ;;
        --interval=*) INTERVAL="${1#*=}"; shift ;;
        *) echo "Unknown parameter: $1"; usage ;;
    esac
done

# Infinite loop to sync every 10 seconds
while true; do
    echo "Syncing $SOURCE_PATH to $DEST_PATH at $(date) per $INTERVAL seconds"
    gcloud storage rsync --delete-unmatched-destination-objects -r --gzip-in-flight-all "$SOURCE_PATH" "$DEST_PATH"
    if [ $? -eq 0 ]; then
        echo "Sync completed successfully"
    else
        echo "Sync failed with exit code $?"
    fi
    sleep $INTERVAL
done