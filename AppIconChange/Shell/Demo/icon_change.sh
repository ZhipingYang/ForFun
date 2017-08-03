
PATH=${PATH}:/usr/local/bin
BuildNumber=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "$INFOPLIST_FILE")
echo Build: $BuildNumber
VersionNumber=$(/usr/libexec/PlistBuddy -c "Print CFBundleShortVersionString" "${INFOPLIST_FILE}")
echo Version: $VersionNumber
cfBundleIdentifier=${PRODUCT_BUNDLE_IDENTIFIER}
echo BundleIdentifier: $cfBundleIdentifier
DateString=$(date +%Y-%m-%d:%H:%M) # 2017-08-03:15:23
echo Date: $DateString
IFS=$'\n'

function generateIcon () {
    
    PROJECT_IMAGE_NAME=$1  # project工程对象中icon名 用户定义，可变的
    TARGET_IMAGE_NAME=$2 # app安装包中的icon名 固定模式，不可变的
    
    TARGET_PATH="${BUILT_PRODUCTS_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/${TARGET_IMAGE_NAME}"
    PROJECT_IMAGE_PATH=$(find ${SRCROOT} -name ${PROJECT_IMAGE_NAME})
    echo TARGET_PATH: $TARGET_PATH
    echo PROJECT_IMAGE_PATH: $PROJECT_IMAGE_PATH
    
    WIDTH=$(identify -format %w ${PROJECT_IMAGE_PATH}) # 获取
    FONT_SIZE=$(echo "$WIDTH * .1" | bc -l)
    
    convert beta.png -resize $WIDTHx$WIDTH resizedBeta.png
    convert resizedBeta.png -fill white -font AndaleMono -pointsize ${FONT_SIZE} -gravity south \
    -annotate 0 "$DateString\nversion:$VersionNumber\nbuild:$BuildNumber" resizedBeta.png
    convert ${PROJECT_IMAGE_PATH} - | composite resizedBeta.png - ${TARGET_PATH}
    
    rm -f -- resizedBeta.png
}

if [ "$cfBundleIdentifier" != "cn.autopai.violationquery" ]; then
    
    if !(brew ls --versions imagemagick > /dev/null) || !(brew ls --versions ghostscript > /dev/null); then
    echo "不需要运行脚本,需要有homebrew及homebrew子安装包imagemagick、ghostscript缺一不可"
        else
    echo "bundleID: $cfBundleIdentifier 开始修改icon"
        generateIcon "app_icon_60@2x.png" "AppIcon60x60@2x.png" 
        generateIcon "app_icon_60@3x.png" "AppIcon60x60@3x.png"
        echo "bundleID: $cfBundleIdentifier 结束修改icon"
    fi
    
else
echo "bundleID: $cfBundleIdentifier 不可修改icon"
fi