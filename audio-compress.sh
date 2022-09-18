# !/bin/bash

read -p "Please enter the audio directory? " directory

if [[ -z ${directory} ]]; then
    echo "压缩文件夹路径不能为空"
    exit 1
else
    if [[ -z $(which lame) ]]; then
        echo "安装lame环境"
        sudo apt install lame -y
    fi

    # 处理输入文件夹路径开始与结尾处的引号
    src_dir=$(echo $directory | sed "s/[\"']//g")

    echo "压缩wav/mp3开始"
    find "${src_dir}" \( -iname '*.wav' -or -iname '*.mp3' \) -exec lame --verbose {} +

    echo "压缩wav/mp3完成"
fi








