#!/bin/sh

function usage(){
    echo "-h --help \n" \
         "  将10/13位时间戳转换为本地时间 \n"\
         "  参数：时间戳，支持10/13位两种 \n"\
         "  默认值：当前时间向后5min \n"\
         "  e.g. 1483430400(10位秒时间戳),1483430400000(13位毫秒时间戳) \n"
    exit 1
}

###
os_platform=`uname -s`
if [[ $# -le 0 ]]; then
    echo "默认按照当前时间向后5min取值"
    if [[ "${os_platform}" = "Darwin" ]];then
        echo `date -v+5M +"%Y-%m-%d %H:%M:%S"`
        echo `date +"%Y-%m-%d %H:%M:%S"`
        if [[ `date +"%Y-%m-%d"` = "2023-11-00" ]];then
           echo "符合"
           source ~/downloads/helloworld.sh
           . ~/downloads/helloworld.sh
           else
           echo "不符合"
           sleep 60
           source ~/downloads/timedate.sh
           . ~/downloads/timedate.sh
        fi
    elif [[ "${os_platform}" = "Linux" ]];then
        echo `date -d +5min +"%Y-%m-%d %H:%M:%S"`
    fi
else
    case $1 in
      -h|--help)
          usage
      ;;
      *)
          timestampStr=${1}
          length=`echo ${#timestampStr}`
          if [[ ${length} -ne 10 ]] && [[ ${length} -ne 13 ]];then
              echo "请输入10/13位数字时间戳"
              exit 1
          elif [[ ${length} -eq 13 ]];then
              timestampStr=${timestampStr:0:10}
          fi
          echo "时间戳位：${timestampStr}"
      if [[ "${os_platform}" = "Darwin" ]];then
              dateStr=`date -r${timestampStr} +"%Y-%m-%d %H:%M:%S"`
          elif [[ "${os_platform}" = "Linux" ]];then
              dateStr=`date -d @${timestampStr} +"%Y-%m-%d %H:%M:%S"`
          fi
          echo "${1}对应的本地时间为${dateStr}"
      ;;
    esac
fi