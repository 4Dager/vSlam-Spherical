# Binaries for Spherical Slam 

##  1. Overview
This repository contains binaries for running slam with spherical panoramal images.We have tested it on the following platform:

CPU i7 + Ubuntu 16.04 with gcc version 5.4.0

Please follow the guidence following to install the package on above platform.


```
插入视频
```
##  2. Prerequisites

### Pangolin
We use [Pangolin](https://github.com/stevenlovegrove/Pangolin)for visualization and user interface.

### OpenCV
We use [OpenCV](https://opencv.org/)to manipulate images and features.

### Eigen3
Required by g2o (see below). Download and install instructions can be found at: http://eigen.tuxfamily.org. Required at least 3.1.0.

### DBoW2 and g2o (Included in Thirdparty folder)
We use modified versions of the [DBoW2](https://github.com/dorian3d/DBoW2) library to perform place recognition and [g2o](https://github.com/RainerKuemmerle/g2o) library to perform non-linear optimizations. Both modified libraries (which are BSD) are included in the Thirdparty folder.

## 3.Install
(1) Download vSlam-Spherical;

(2) Setting the directory of shared library;

- >  在/etc/ld.so.conf.d/下新建libpanoramaslam.conf，在其中写入PanoramaSlamSDK/lib/thirdparty/下的库地址；

    例如：
    
    /home/dorothy/Desktop/PanoramaSlamSDK/lib/Thirdparty/DBoW2/lib
          
    /home/dorothy/Desktop/PanoramaSlamSDK/lib/Thirdparty/g2o/lib
        
    运行 sudo ldconfig;
- > 在.bashrc 下添加 LD_LIDBRARY_PATH=sdk/lib:$LD_LIDBRARY_PATH;

    例如：
    
    /home/dorothy/Desktop/PanoramaSlamSDK/lib
    
    运行source ~/.bashrc

(3) 运行install.sh脚本
    
```
cd PanoramaSlamSDK
  ./install.sh
```

(4)可用ldd 命令查看可执行文件是否正确链接动态库

例如：
       ldd libPanoramaSLAM
       ldd panorama_slam

(5)运行命令

```
 cd sdk
  ./apps/panorama_slam ./apps/ORBvoc.bin ./config/panorama.yaml ./imagedata/ end_num
  
```

其中 panorama.yaml 为全景图片的标定文件；
       imagedata 存放图片数据，图片命名格式为pano%d.jpg,从0开始命名，图片大小为1920*960
       end_num 为图片总数

