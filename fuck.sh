##ipa解包

##mac登录用户名
USER_DIR="eport2"
##包文件名
IPA_FILE="zshg_ios.ipa"
##包原始路径
IPA_DIR="/Users/${USER_DIR}/Downloads/zshg_ios 2021-02-02 09-01-48"
##解压路径临时目录
IPA_TEMP_DIR="/Users/${USER_DIR}/Downloads/ipa"
##读取版本号
APP_VER=""
##最终文件名
APP_FILE_NAME=""

function checkTmpDir(){
##删除临时目录
if [ -d "$IPA_TEMP_DIR" ]; then
echo "rm ${IPA_TEMP_DIR}"
rm -rf "${IPA_TEMP_DIR}"
else
echo "mkdir $IPA_TEMP_DIR"
mkdir -p "${IPA_TEMP_DIR}"
fi
unzipIpa
}

function unzipIpa(){
##解包IPA
if [[ -f "$IPA_DIR/$IPA_FILE" ]]; then
echo "unzip $IPA_DIR/$IPA_FILE begin ..."
unzip -q "$IPA_DIR/$IPA_FILE" -d "$IPA_TEMP_DIR"
if [[ $? != 0 ]]; then
echo "unzip $IPA_DIR/$IPA_FILE failed"
exit 2
else
echo "unzip $IPA_DIR/$IPA_FILE successed"
fi
fi
searchAppDir
}

searchAppDir(){
##定位到*.app⽬录
appDir="$IPA_TEMP_DIR/Payload/`ls "$IPA_TEMP_DIR/"Payload`"
##定位到plist⽂件
infoPlist="${appDir}/Info.plist"
echo ${infoPlist}
loadVer
}

##读取版本号
loadVer(){
	tempValue=`/usr/libexec/PlistBuddy -c "Print :CFBundleShortVersionString" $infoPlist`
    echo $tempValue
	APP_VER=$tempValue
	renameFileName
}
##重命名文件
renameFileName(){
	cp "${IPA_DIR}/${IPA_FILE}" "${IPA_TEMP_DIR}/zshg_ios-${APP_VER}.ipa"
	APP_FILE_NAME="zshg_ios-${APP_VER}.ipa"
}



checkTmpDir