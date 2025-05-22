#!/bin/bash

NDK_PATH="/c/Program Files/Unity/Hub/Editor/6000.0.48f1/Editor/Data/PlaybackEngines/AndroidPlayer/NDK"
if [ ! -d "$NDK_PATH" ]; then
    echo "NDK not found: $NDK_PATH"
    exit 1
fi

mkdir -p build
cd build

cmake .. \
    -DCMAKE_TOOLCHAIN_FILE="$NDK_PATH/build/cmake/android.toolchain.cmake" \
    -DANDROID_ABI=arm64-v8a \
    -DANDROID_PLATFORM=android-24 \
    -DCMAKE_BUILD_TYPE=Release \
    -G "MinGW Makefiles"

cmake --build . --config Release
