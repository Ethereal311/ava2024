IN_DATA_DIR="/Users/machenyang/Desktop/AVA_Demo/yasmine_video_ava_cut/cropped"
OUT_DATA_DIR="/Users/machenyang/Desktop/AVA_Demo/yasmine_video_rawframes"

if [[ ! -d "${OUT_DATA_DIR}" ]]; then
  echo "${OUT_DATA_DIR} doesn't exist. Creating it.";
  mkdir -p ${OUT_DATA_DIR}
fi

for video in $(ls -A1 -U ${IN_DATA_DIR}/*)
do
  echo "Processing file: $video"
  video_name=${video##*/}

  # Remove file extension more safely
  video_name="${video_name%.*}"

  out_video_dir=${OUT_DATA_DIR}/${video_name}/
  mkdir -p "${out_video_dir}"

  out_name="${out_video_dir}/${video_name}_%06d.jpg"

  ffmpeg -i "${video}" -r 30 -q:v 1 "${out_name}"
done
