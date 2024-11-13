import os
import csv


def generate_csv(folder_path, output_csv_path):
  # 创建 CSV 文件
  with open(output_csv_path, 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    # 写入表头
    writer.writerow(['original_video_id', 'video_id', 'frame_id', 'path', 'labels'])

    # 遍历主文件夹中的所有子文件夹（视频）
    for video_id, video_folder in enumerate(os.listdir(folder_path)):
      video_folder_path = os.path.join(folder_path, video_folder)

      if os.path.isdir(video_folder_path):
        # 遍历视频文件夹中的所有帧
        for frame_id, frame_file in enumerate(os.listdir(video_folder_path)):
          if frame_file.lower().endswith(('.jpg', '.png', '.jpeg')):  # 仅处理图片文件
            frame_path = os.path.join(video_folder, frame_file)
            frame_path = frame_path.replace('\\', '/')
            # 写入 CSV 文件
            writer.writerow([video_folder, video_id, frame_id, frame_path, ''])


# 设置主文件夹路径和输出 CSV 文件路径
main_folder_path = r'/Users/machenyang/Desktop/ava_demo/yasmine_video_rawframes'  # 替换为你的主文件夹路径
output_csv_file = r'/Users/machenyang/Desktop/ava_demo/annotations/output.csv'  # 替换为你想要生成的 CSV 文件路径

# 生成 CSV 文件
generate_csv(main_folder_path, output_csv_file)
