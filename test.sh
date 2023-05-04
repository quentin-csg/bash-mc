#!/bin/bash

folder_name=$1

mkdir $folder_name
mkdir_status=$?

if [ $mkdir_status -ne 0 ]; then
    echo "Error creating directory: $folder_name"
    exit $mkdir_status
fi