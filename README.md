1:安装Pangolin

2:安装opencv3.3版本

3:下载PanoramaSlamSDK

4:设置动态库地址
  (1) 在/etc/ld.so.conf.d/下新建libpanoramaslam.conf，在其中写入PanoramaSlamSDK/lib/thirdparty/下的库地址；
      例如：
          /home/dorothy/Desktop/PanoramaSlamSDK/lib/Thirdparty/DBoW2/lib
          /home/dorothy/Desktop/PanoramaSlamSDK/lib/Thirdparty/g2o/lib
      运行 sudo ldconfig;
  (2) 在.bashrc 下添加 LD_LIDBRARY_PATH=sdk/lib:$LD_LIDBRARY_PATH;
      例如：
          /home/dorothy/Desktop/PanoramaSlamSDK/lib
      运行source ~/.bashrc

5:运行install.sh脚本
  cd PanoramaSlamSDK
  ./install.sh

6:可用ldd 命令查看可执行文件是否正确链接动态库
  例如：
       ldd libPanoramaSLAM
       ldd panorama_slam

7:运行命令 
  cd sdk
  ./apps/panorama_slam ./apps/ORBvoc.bin ./config/panorama.yaml ./imagedata/ end_num
  其中 panorama.yaml 为全景图片的标定文件；
       imagedata 存放图片数据，图片命名格式为pano%d.jpg,从0开始命名，图片大小为1920*960
       end_num 为图片总数


适配机型：
Ubuntu 16.04
gcc version 5.4.0
cpu Core i7-7700HQ


