IN_DATA_DIR="/Users/machenyang/Desktop/AVA_Demo/yasmine_video_ava"
OUT_DATA_DIR="/Users/machenyang/Desktop/AVA_Demo/yasmine_video_ava_cut"

if [[ ! -d "${OUT_DATA_DIR}" ]]; then
  echo "${OUT_DATA_DIR} doesn't exist. Creating it.";
  mkdir -p ${OUT_DATA_DIR}
fi

for video in $(ls -A1 -U ${IN_DATA_DIR}/*)
do
  out_name="${OUT_DATA_DIR}/${video##*/}"
  if [ ! -f "${out_name}" ]; then
    ffmpeg -ss 00:00:00.0 -to 00:00:20.0 -i "${video}" -r 30 "${out_name}"
  fi
done
