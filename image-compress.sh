# !/bin/bash

read -p "Please enter the image directory? " directory

if [[ -z ${directory} ]]; then
    echo "压缩文件夹路径不能为空"
    exit 1
else
    if [[ -z $(which pngquant) ]]; then
        echo "安装pngquant环境"
        sudo apt install pngquant -y
    fi

    if [[ -z $(which jpegoptim) ]]; then
        echo "安装jpegoptim环境"
        sudo apt install jpegoptim -y
    fi

    # 处理输入文件夹路径开始与结尾处的引号
    src_dir=$(echo $directory | sed "s/[\"']//g")

    echo "压缩png开始"
    find "${src_dir}" -iname '*.png' -exec pngquant --skip-if-larger --ext .png --force -v {} +

    echo "压缩jpg/jpeg开始"
    find "${src_dir}" \( -iname '*.jpg' -or -iname '*.jpeg' \) -exec jpegoptim -v {} +

    echo "压缩image完成"
fi








