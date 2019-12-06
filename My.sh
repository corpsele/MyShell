dir="shell"

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

function writeHFile(){
	echo '请输入类名 '
	read name
	import1='#import <Foundation/Foundation.h>\n\n'
    import2='@interface '$name' : NSObject\n\n'
    import3='@end'
	# sudo sh -c echo "#import <Foundation/Foundation.h>\n\n" | sudo tee >> shell/$name.h
	# sudo sh -c echo "@interface $name : NSObject" | sudo tee >> shell/$name.h
	# sudo sh -c echo "@end" >> shell/$name.h
# cat << EOF >> /shell/$name.h  
# 	   #import <Foundation/Foundation.h>\n\n

# 	   @interface $name : NSObject

# 	   @end
# EOF
    echo '' |sudo tee shell/$name.h
    echo $import1 |sudo tee -a shell/$name.h
    echo $import2 |sudo tee -a shell/$name.h
    echo $import3 |sudo tee -a shell/$name.h
	open shell/$name.h
}

function createFile(){
	
}

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
	   writeHFile
    else
	   echo '创建失败'
    fi
else
   writeHFile
fi

