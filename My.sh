. table.sh




dir="shell"
glocalname=""

# cat << EOF > /shell/$name.h  
# 	   #import <Foundation/Foundation.h>\n\n

# 	   @interface $name : NSObject

# 	   @end
# EOF
	# cat << EOF >> shell/$name.h
	#    #import <Foundation/Foundation.h>\n\n

	#    @interface $name : NSObject

	#    @end
	# EOF

function getNameForFile(){
	echo '请输入类名 '
	read name
	glocalname=$name	
}

function writeHFile(){
	import1='#import <Foundation/Foundation.h>\n\n'
    import2='@interface '$glocalname'VC : NSObject\n\n'
    import3='@end'
	# sudo sh -c echo "#import <Foundation/Foundation.h>\n\n" | sudo tee >> shell/$name.h
	# sudo sh -c echo "@interface $name : NSObject" | sudo tee >> shell/$name.h
	# sudo sh -c echo "@end" >> shell/$name.h
# cat << EOF >> /shell/$name.h  
# 	   #import <Foundation/Foundation.h>\n\n

# 	   @interface $name : NSObject

# 	   @end
# EOF
    path='shell/'$glocalname
    suffixName='VC.h'
    fullpath=$path$suffixName
    echo '' |sudo tee $fullpath
    echo $import1 |sudo tee -a $fullpath
    echo $import2 |sudo tee -a $fullpath
    echo $import3 |sudo tee -a $fullpath
	open $fullpath
}

function writeMFile(){
	echo 'writeMFile'
	import1='#import "'$glocalname'VC.h"\n\n'
    import2='@interface '$glocalname'VC()\n\n'
    import21='@property (nonatomic,strong) '$glocalname'VM *vm;\n\n'
    import3='@end\n'
    import4='@implementation '$glocalname'VC\n'
    import5='@end\n'
    path='shell/'$glocalname
    suffixName='VC.m'
    fullpath=$path$suffixName
	echo '' |sudo tee $fullpath
    echo $import1 |sudo tee -a $fullpath
    echo $import2 |sudo tee -a $fullpath
    echo $import21 |sudo tee -a $fullpath
    echo $import3 |sudo tee -a $fullpath
    echo $import4 |sudo tee -a $fullpath
    echo $import5 |sudo tee -a $fullpath
	open $fullpath
}

function writeVMHFile(){
	import1='#import <Foundation/Foundation.h>\n\n'
    import2='@interface '$glocalname'VM : NSObject\n\n'
    import3='@end'
    path='shell/'$glocalname
    suffixName='VM.h'
    fullpath=$path$suffixName
    echo '' |sudo tee $fullpath
    echo $import1 |sudo tee -a $fullpath
    echo $import2 |sudo tee -a $fullpath
    echo $import3 |sudo tee -a $fullpath
	open $fullpath
}

function writeVMMFile(){
	echo 'writeVMMFile'
	import1='#import "'$glocalname'VM.h"\n\n'
    import2='@interface '$glocalname'VM()\n\n'
    import3='@end\n'
    import4='@implementation '$glocalname'VM\n'
    import5='@end\n'
    path='shell/'$glocalname
    suffixName='VM.m'
    fullpath=$path$suffixName
	echo '' |sudo tee $fullpath
    echo $import1 |sudo tee -a $fullpath
    echo $import2 |sudo tee -a $fullpath
    echo $import3 |sudo tee -a $fullpath
    echo $import4 |sudo tee -a $fullpath
    echo $import5 |sudo tee -a $fullpath
	open $fullpath
}


function toPermissionFiles(){
	sudo chmod -R 777 ./
}

function createFile(){
	echo 'createFile'
	if [[ ! -d 'shell' ]]; 
	then
		#statements
		echo $dir'文件夹不存在, 正在创建...'
		sudo mkdir shell
		# echo '创建完成'
		if [[ -d 'shell' ]]; 
		then
		#statements
		   echo '创建成功'
		   toPermissionFiles
		   getNameForFile
		   writeHFile
		   writeMFile
		   writeVMHFile
		   writeVMMFile
	    else
		   echo '创建失败'
	    fi
	else
		toPermissionFiles
		getNameForFile
	   writeHFile
	   writeMFile
	   writeVMHFile
	   writeVMMFile
	fi
}

function createClass(){
	echo 'Please Input Class Name:'
	read className
	echo 'Please Input Extends Super Class Name:'
	read superClassName
	echo 'Creating Class ...'

	import1='#import <Foundation/Foundation.h>\n\n'
    import2='@interface '$className' : '$superClassName'\n\n'
    import3='@end'
    path='shell/'$className
    suffixName='.h'
    fullpath=$path$suffixName
    echo '' |sudo tee $fullpath
    echo $import1 |sudo tee -a $fullpath
    echo $import2 |sudo tee -a $fullpath
    echo $import3 |sudo tee -a $fullpath
	open $fullpath

	import1='#import "'$className'.h"\n\n'
    import2='@interface '$className'()\n\n'
    import3='@end\n'
    import4='@implementation '$className'\n'
    import5='@end\n'
    path='shell/'$className
    suffixName='.m'
    fullpath=$path$suffixName
	echo '' |sudo tee $fullpath
    echo $import1 |sudo tee -a $fullpath
    echo $import2 |sudo tee -a $fullpath
    echo $import3 |sudo tee -a $fullpath
    echo $import4 |sudo tee -a $fullpath
    echo $import5 |sudo tee -a $fullpath
	open $fullpath
	echo 'Done'
}

function createCodes(){
	echo 'Choose your Code'
	echo '1:Corner'
	read index
	case $index in
		1)
          createCodeForCorner
        ;;
	esac 
}

function createCodeForCorner(){
	echo 'Create Code for corner, Please input cornerRadius with float:'
	read radius
	floatpattern='^([1-9]+(\.\d+)?|0\.\d+)$'
	# floatpattern='^(([1-9]\d*)|0)(\.\d{1-2})?$'
	# floatpattern='^(-?\d+)(\.\d+)?$'
	echo $floatpattern
	# echo $radius | sed '^(-?\d+)(\.\d+)?$'
	if [[ $radius =~ $floatpattern ]]; then
		#statements
		echo 'creating'
	else
		echo 'please input float num'
		exit;
	fi
	code1='v.layer.masksToBounds = true;'
    code2='v.layer.cornerRadius = '$radius'f;'
    echo '--code begin--'
    echo $code1
    echo $code2
    echo '--code end--'
}

echo 'choose ur way'
echo '1: Create MVVM Files With OC'
echo '2: Create Class File With OC'
echo '3: Create Codes'
read index

case $index in
	1 )
      createFile
		;;
	2)
      createClass
    ;;
    3)
      createCodes
    ;;
esac



