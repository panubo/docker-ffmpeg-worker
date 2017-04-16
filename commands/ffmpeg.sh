#!/usr/bin/env bash

set -ex

while read JOB
do
  echo "$JOB"
done < "${1:-/dev/stdin}"

INPUT_FILE="${INPUT_PATH}/$JOB"
OUTPUT_FILE="${OUTPUT_PATH}/$JOB"
WATERMARK=/media/watermark.png

ffmpeg -i $INPUT_FILE -vf "movie=${WATERMARK} [watermark]; [in][watermark] overlay=(main_w-overlay_w-10):(main_h-overlay_h-10) [out]" ${OUTPUT_FILE}
