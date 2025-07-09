#!/bin/bash

# Script to organize sample packs for iOS/watchOS/iPadOS development
# Converts audio files to m4a format and organizes with numerical naming convention

SOURCE_DIR="/Users/jade/Documents/SAMPLE PACKS"
DEST_DIR="/Users/jade/sample-packs/organized_packs"

# Create destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Define the naming convention mapping
declare -A FOLDER_MAPPING=(
    ["kick"]="1"
    ["kicks"]="1"
    ["snare"]="2"
    ["snares"]="2"
    ["hat"]="3"
    ["hats"]="3"
    ["hihat"]="3"
    ["hihats"]="3"
    ["clap"]="4"
    ["claps"]="4"
    ["percussion"]="5"
    ["perc"]="5"
    ["cymbal"]="6"
    ["cymbals"]="6"
    ["cymblage"]="6"
    ["crash"]="6"
    ["fx"]="7"
    ["fills"]="7"
    ["fill"]="7"
    ["misc"]="8"
    ["other"]="8"
)

# Function to convert audio file to m4a
convert_to_m4a() {
    local input_file="$1"
    local output_file="$2"
    
    # Check if output file already exists
    if [[ -f "$output_file" ]]; then
        echo "Skipping $output_file - already exists"
        return 0
    fi
    
    # Convert to m4a with optimal settings for iOS
    ffmpeg -i "$input_file" -c:a aac -b:a 128k -movflags +faststart "$output_file" -y 2>/dev/null
    
    if [[ $? -eq 0 ]]; then
        echo "Converted: $input_file -> $output_file"
        return 0
    else
        echo "Failed to convert: $input_file"
        return 1
    fi
}

# Function to get folder number from folder name
get_folder_number() {
    local folder_name="$1"
    local lowercase_name=$(echo "$folder_name" | tr '[:upper:]' '[:lower:]')
    
    # Remove common prefixes and suffixes
    lowercase_name=$(echo "$lowercase_name" | sed 's/^fb //g' | sed 's/^glitch_//g' | sed 's/drum//g' | sed 's/ //g')
    
    # Check for exact matches first
    for key in "${!FOLDER_MAPPING[@]}"; do
        if [[ "$lowercase_name" == "$key" ]]; then
            echo "${FOLDER_MAPPING[$key]}"
            return 0
        fi
    done
    
    # Check for partial matches
    for key in "${!FOLDER_MAPPING[@]}"; do
        if [[ "$lowercase_name" == *"$key"* ]]; then
            echo "${FOLDER_MAPPING[$key]}"
            return 0
        fi
    done
    
    # Default to 8 (misc) if no match found
    echo "8"
}

# Function to process a sample pack
process_sample_pack() {
    local pack_dir="$1"
    local pack_name=$(basename "$pack_dir")
    
    echo "Processing pack: $pack_name"
    
    # Create pack directory in destination
    local pack_dest="$DEST_DIR/$pack_name"
    mkdir -p "$pack_dest"
    
    # Check if this pack has subdirectories (organized drum kit)
    local has_subdirs=false
    
    for subdir in "$pack_dir"/*; do
        if [[ -d "$subdir" ]]; then
            has_subdirs=true
            break
        fi
    done
    
    if [[ "$has_subdirs" == true ]]; then
        # Process organized drum kit with subdirectories
        for subdir in "$pack_dir"/*; do
            if [[ -d "$subdir" ]]; then
                local subdir_name=$(basename "$subdir")
                local folder_num=$(get_folder_number "$subdir_name")
                
                # Create numbered directory
                local numbered_dir="$pack_dest/$folder_num"
                mkdir -p "$numbered_dir"
                
                echo "  Processing subdirectory: $subdir_name -> $folder_num"
                
                # Convert all audio files in this subdirectory
                for audio_file in "$subdir"/*; do
                    if [[ -f "$audio_file" ]]; then
                        local filename=$(basename "$audio_file")
                        local extension="${filename##*.}"
                        
                        # Skip non-audio files
                        if [[ "$extension" =~ ^(wav|aif|aiff|mp3|m4a|flac)$ ]]; then
                            local base_name="${filename%.*}"
                            local output_file="$numbered_dir/${base_name}.m4a"
                            
                            convert_to_m4a "$audio_file" "$output_file"
                        fi
                    fi
                done
            fi
        done
    else
        # Process flat structure (like melody packs)
        echo "  Processing flat structure"
        
        # Create a general directory (numbered as 0 for melodic content)
        local general_dir="$pack_dest/0"
        mkdir -p "$general_dir"
        
        # Convert all audio files
        for audio_file in "$pack_dir"/*; do
            if [[ -f "$audio_file" ]]; then
                local filename=$(basename "$audio_file")
                local extension="${filename##*.}"
                
                # Skip non-audio files and image files
                if [[ "$extension" =~ ^(wav|aif|aiff|mp3|m4a|flac)$ ]]; then
                    local base_name="${filename%.*}"
                    local output_file="$general_dir/${base_name}.m4a"
                    
                    convert_to_m4a "$audio_file" "$output_file"
                fi
            fi
        done
    fi
}

# Main processing loop
echo "Starting sample pack organization..."
echo "Source: $SOURCE_DIR"
echo "Destination: $DEST_DIR"
echo ""

# Process each sample pack
for pack_dir in "$SOURCE_DIR"/*; do
    if [[ -d "$pack_dir" ]]; then
        process_sample_pack "$pack_dir"
        echo ""
    fi
done

echo "Organization complete!"
echo ""
echo "Folder numbering convention:"
echo "1 = Kicks"
echo "2 = Snares"
echo "3 = Hats"
echo "4 = Claps"
echo "5 = Percussion"
echo "6 = Cymbals"
echo "7 = FX/Fills"
echo "8 = Misc/Other"
echo "0 = Melodic Content"