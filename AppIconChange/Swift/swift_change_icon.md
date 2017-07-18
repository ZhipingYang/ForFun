```bash
PATH_TO_ICON_PROCESSOR="$PROJECT_DIR/Scripts/icon_processor.swift"
PATH_TO_ORIGIN_ICON="$PROJECT_DIR/Pure Awesome/Assets.xcassets/AppIcon.appiconset"
PATH_TO_OUTPUT_ICON="$PROJECT_DIR/Pure Awesome/Assets.xcassets/AppIconDebug.appiconset"
VERSION_NUMBER=$(/usr/libexec/PlistBuddy -c "Print CFBundleShortVersionString" "${PROJECT_DIR}/${INFOPLIST_FILE}")
BUILD_NUMBER=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "${PROJECT_DIR}/${INFOPLIST_FILE}")
BUILD_TYPE="D"

swift -sdk $(xcrun --show-sdk-path --sdk macosx) "$PATH_TO_ICON_PROCESSOR" "$PATH_TO_ORIGIN_ICON" "$PATH_TO_OUTPUT_ICON" "$VERSION_NUMBER" "$BUILD_NUMBER" "$BUILD_TYPE"
```
