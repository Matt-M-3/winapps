#!/bin/bash

# Define the base directory for your winapps repository
BASE_DIR="${PWD}/apps"

# Loop through each app directory
for app_dir in "$BASE_DIR"/*; do
    if [ -d "$app_dir" ]; then
        app_name=$(basename "$app_dir")
        info_file="$app_dir/info"
        icon_file="$app_dir/icon.svg"
        icon_path="${BASE_DIR}/$app_name/icon.svg"

        if [ -f "$info_file" ]; then
            echo "Processing $info_file..."
            # Check if icon.svg exists in the app directory
            if [ -f "$icon_file" ]; then
                # Check if ICON variable is present in the info file
                if grep -q "^ICON=" "$info_file"; then
                    # Update the ICON variable
                    sed -i "s|^ICON=.*|ICON=$icon_path|" "$info_file"
                    echo "Updated existing ICON in $info_file to $icon_path"
                else
                    # Add the ICON variable to the end of the info file
                    echo "ICON=$icon_path" >> "$info_file"
                    echo "Added new ICON entry in $info_file pointing to $icon_path"
                fi

                # Display the content of the info file for verification
                echo "Content of $info_file after update:"
                cat "$info_file"
            else
                echo "Icon file not found for $app_dir"
            fi
        else
            echo "Info file not found for $app_dir"
        fi
    fi
done
