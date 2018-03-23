#!/bin/sh
# Force Bourne shell in case tcsh is default.
#

#
# Reads the bundle type
#

echo "========================================================"
echo "    Bundle creation script"
echo "========================================================"
echo ""

echo "Striping executable..."
strip "SmartSet App-Freestyle (Mac)"

echo "Compressing executable..."
upx "/users/jeremy/kinesis/SmartSet FSEdge/SmartSet App-Freestyle (Mac)"

echo "Moving files in app package..."
#Remove the link to the executable
rm "SmartSet App-Freestyle (Mac).app/Contents/MacOS/SmartSet App-Freestyle (Mac)"
#Move the executable in the app package
mv "SmartSet App-Freestyle (Mac)" "SmartSet App-Freestyle (Mac).app/Contents/MacOS"
#Copy the icon file in the app package
cp "SmartSetFSEdge.icns" "SmartSet App-Freestyle (Mac).app/Contents/Resources"

echo "Signing application..."
codesign -f -s 'Developer ID Application: CreoSource Inc (22Z54K6APL)' -v 'SmartSet App-Freestyle (Mac).app'

echo "DONE !"