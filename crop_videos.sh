#!/bin/bash

# Directory containing the original videos
IN_DIR="/Users/machenyang/Desktop/AVA_Demo/yasmine_video_ava_cut"

# Directory to save the cropped videos
OUT_DIR="/Users/machenyang/Desktop/AVA_Demo/yasmine_video_ava_cut/cropped"

# Check if the output directory exists, create it if not
if [ ! -d "${OUT_DIR}" ]; then
  echo "Output directory does not exist. Creating it."
  mkdir -p "${OUT_DIR}"
fi

# Iterate over each video file in the input directory
for video in "${IN_DIR}"/*.MP4
do
  # Define the output file path
  out_video="${OUT_DIR}/$(basename "${video}")"

  # Crop the bottom 50 pixels from the video
  ffmpeg -i "${video}" -filter:v "crop=in_w:in_h-50:0:0" "${out_video}"

  echo "Processed ${video}, saved to ${out_video}"
done

echo "All videos have been processed."
