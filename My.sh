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

function getNameForFile() {
    echo '请输入类名 '
    read name
    glocalname=$name
}

function writeHFile() {
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
    echo '' | sudo tee $fullpath
    echo $import1 | sudo tee -a $fullpath
    echo $import2 | sudo tee -a $fullpath
    echo $import3 | sudo tee -a $fullpath
    open $fullpath
}

function writeMFile() {
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
    echo '' | sudo tee $fullpath
    echo $import1 | sudo tee -a $fullpath
    echo $import2 | sudo tee -a $fullpath
    echo $import21 | sudo tee -a $fullpath
    echo $import3 | sudo tee -a $fullpath
    echo $import4 | sudo tee -a $fullpath
    echo $import5 | sudo tee -a $fullpath
    open $fullpath
}

function writeVMHFile() {
    import1='#import <Foundation/Foundation.h>\n\n'
    import2='@interface '$glocalname'VM : NSObject\n\n'
    import3='@end'
    path='shell/'$glocalname
    suffixName='VM.h'
    fullpath=$path$suffixName
    echo '' | sudo tee $fullpath
    echo $import1 | sudo tee -a $fullpath
    echo $import2 | sudo tee -a $fullpath
    echo $import3 | sudo tee -a $fullpath
    open $fullpath
}

function writeVMMFile() {
    echo 'writeVMMFile'
    import1='#import "'$glocalname'VM.h"\n\n'
    import2='@interface '$glocalname'VM()\n\n'
    import3='@end\n'
    import4='@implementation '$glocalname'VM\n'
    import5='@end\n'
    path='shell/'$glocalname
    suffixName='VM.m'
    fullpath=$path$suffixName
    echo '' | sudo tee $fullpath
    echo $import1 | sudo tee -a $fullpath
    echo $import2 | sudo tee -a $fullpath
    echo $import3 | sudo tee -a $fullpath
    echo $import4 | sudo tee -a $fullpath
    echo $import5 | sudo tee -a $fullpath
    open $fullpath
}

function toPermissionFiles() {
    sudo chmod -R 777 ./
}

function createFile() {
    echo 'createFile'
    if [[ ! -d 'shell' ]]; then
        #statements
        echo $dir'文件夹不存在, 正在创建...'
        sudo mkdir shell
        # echo '创建完成'
        if [[ -d 'shell' ]]; then
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

function createClass() {
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
    echo '' | sudo tee $fullpath
    echo $import1 | sudo tee -a $fullpath
    echo $import2 | sudo tee -a $fullpath
    echo $import3 | sudo tee -a $fullpath
    open $fullpath

    import1='#import "'$className'.h"\n\n'
    import2='@interface '$className'()\n\n'
    import3='@end\n'
    import4='@implementation '$className'\n'
    import5='@end\n'
    path='shell/'$className
    suffixName='.m'
    fullpath=$path$suffixName
    echo '' | sudo tee $fullpath
    echo $import1 | sudo tee -a $fullpath
    echo $import2 | sudo tee -a $fullpath
    echo $import3 | sudo tee -a $fullpath
    echo $import4 | sudo tee -a $fullpath
    echo $import5 | sudo tee -a $fullpath
    open $fullpath
    echo 'Done'
}

function createCodes() {
    echo 'Choose your Code'
    echo '1:Corner'
    echo '2:Color With Hex For OC'
    echo '3:iPhoneX for Swift'
    echo '4:iPhoneX for OC'
    read index
    case $index in
    1)
        createCodeForCorner
        ;;
    2)
        createCodeForColor
        ;;
    3)
        createCodeForiPhoneXSwift
        ;;
    4)
        createCodeForiPhoneXOC
        ;;

    esac
}

function createCodeForiPhoneXOC() {
    code="
if (@available(iOS 11.0, *)) {\n
    self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;\n
} else {\n
    self.automaticallyAdjustsScrollViewInsets = NO;\n
}"
    code1="self.automaticallyAdjustsScrollViewInsets = NO;\n
self.extendedLayoutIncludesOpaqueBars = YES;\n
self.edgesForExtendedLayout = UIRectEdgeTop;"
    code2="
//是否是iPhone X\n
#define is_iPhoneX          ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)\n
//状态栏高度\n
#define StatusBarHeight     (is_iPhoneX ? 44.f : 20.f)\n
// 导航高度\n
#define NavigationBarHeight 44.f\n
// Tabbar高度.   49 + 34 = 83\n
#define TabbarHeight        (is_iPhoneX ? 83.f : 49.f)\n
// Tabbar安全区域底部间隙\n
#define TabbarSafeBottomMargin  (is_iPhoneX ? 34.f : 0.f)\n
// 状态栏和导航高度\n
#define StatusBarAndNavigationBarHeight  (is_iPhoneX ? 88.f : 64.f)\n
#define ViewSafeAreInsets(view) ({UIEdgeInsets insets; if(@available(iOS 11.0, *)) {insets = view.safeAreaInsets;} else {insets = UIEdgeInsetsZero;} insets;})"
    code3="
if (@available(iOS 11.0, *)) {\n
    make.edges.equalTo(self.view.safeAreaInsets);\n
} else {\n
    make.edges.equalTo(self.view);\n
}"
    echo "--code begin--"
    echo $code
    echo $code1
    echo $code2
    echo $code3
    echo "--code end--"
}

function createCodeForiPhoneXSwift() {
    code="static func safeAreaTop() -> CGFloat {\n
               if #available(iOS 11.0, *) {\n
                  //iOS 12.0以后的非刘海手机top为 20.0\n
                  if (UIApplication.shared.delegate as? AppDelegate)?.window?.safeAreaInsets.bottom == 0 {\n
                      return 20.0\n
                   }\n
                   return (UIApplication.shared.delegate as? AppDelegate)?.window?.safeAreaInsets.top ?? 20.0\n
                }\n
               return 20.0\n
          }"
    code1="static func safeAreaBottom() -> CGFloat {\n
                        if #available(iOS 11.0, *) {\n
                            return (UIApplication.shared.delegate as? AppDelegate)?.window?.safeAreaInsets.bottom ?? 0\n
                        }\n
                        return 0\n
                }"
    code2="static func hasSafeArea() -> Bool {\n
                            if #available(iOS 11.0, *) {\n
                                 return (UIApplication.shared.delegate as? AppDelegate)?.window?.safeAreaInsets.bottom ?? CGFloat(0) > CGFloat(0)\n
                            } else { return false }\n
            }"
    code3="static func toolBarHeight() -> CGFloat {\n
                  return 49 + safeAreaBottom()\n
            {"
    code4="static func navigationHeight() -> CGFloat {\n
               return 44 + safeAreaTop()\n
           }"
    echo '--code begin--'
    echo $code
    echo $code1
    echo $code2
    echo $code3
    echo $code4
    echo '--code end--'
}

function createCodeForColor() {
    code1="+ (UIColor *)colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha{\n
     return [UIColor colorWithRed:((hex >> 16) & 0xFF)/255.0
                           green:((hex >> 8) & 0xFF)/255.0
                            blue:(hex & 0xFF)/255.0
                           alpha:alpha];\n}"
    echo '--code begin--'
    echo $code1
    echo '--code end--'
}

function createCodeForCorner() {
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
        exit
    fi
    code1='v.layer.masksToBounds = true;'
    code2='v.layer.cornerRadius = '$radius'f;'
    echo '--code begin--'
    echo $code1
    echo $code2
    echo '--code end--'
}

function chooseFiles() {
    echo "Choose Type..."
    echo '1: OC'
    echo '2: Swift'
    read index
    case $index in
    1)
        formatOC
        ;;
    2)
        formatSwift
        ;;
    esac
}

function formatOC() {
    echo 'formatOC'
    output=$(ls)
    # echo $output
    arr=($(echo $output | tr ',' ' '))
    for i in "${!arr[@]}"; do
        echo "$i: ${arr[i]}"
    done
    echo 'Please select file ...'
    read index
    clang=$(ClangFormaterObjC/format-objc-file.sh ${arr[index]})
    echo $clang
}

function delDeviceData() {
    cmd1=$(rm -r -f /Users/eport2/Library/Developer/Xcode/DerivedData)
    echo $cmd1
    if [[ $cmd1 == "" ]]; then
        echo 'DeviceData清理完成'
    fi
}

function formatSwift() {
    echo 'formatSwift'
    output=$(ls)
    # echo $output
    arr=($(echo $output | tr ',' ' '))
    for i in "${!arr[@]}"; do
        echo "$i: ${arr[i]}"
    done
    echo 'Please select file ...'
    read index
    clang=$(swiftformat ${arr[index]})
    echo $clang
}

echo 'choose ur way'
echo '1: Create MVVM Files With OC'
echo '2: Create Class File With OC'
echo '3: Create Codes'
echo '4: Choose File For Format'
echo '5: Del DeviceData Folder'
read index

case $index in
1)
    createFile
    ;;
2)
    createClass
    ;;
3)
    createCodes
    ;;
4)
    chooseFiles
    ;;
5)
    delDeviceData
    ;;
esac
