#!/data/data/com.termux/files/usr/bin/bash
cd $(dirname $0)
## unset LD_PRELOAD in case termux-exec is installed
unset LD_PRELOAD
# proot
command="proot"
command+=" --link2symlink -0"
# 根目录文件夹
command+=" -r lfs"
# 指定一些目录
command+=" -b /dev -b /proc "
# /dev/shm为内存中的目录(≈内存盘),加快读写速度,也可不设置
command+=" -b lfs/root:/dev/shm"
# 可选项
# command+=" -b $ANDROID_DATA"
# command+=" -b $EXTERNAL_STORAGE"
# command+=" -b $HOME"
# 以下最好不要改动
command+=" -w /root /usr/bin/env"
command+=" -i HOME=/root"
command+=" PATH=/usr/local/sbin:/usr/local/bin:/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games"
command+=" TERM=$TERM"
command+=" LANG=C.UTF-8"
command+=" /bin/bash --login"
echo "--------------------------------------------"
exec $command
