cmake_minimum_required(VERSION 3.10.2)

project(audioplugin_examples)

file(GLOB TELEPORT_CPP "../TeleportLib.cpp" "../Plugin_Teleport.cpp" "../TeleportDemo.cpp")
file(GLOB TELEPORT_H "../TeleportLib.h")
file(GLOB SOURCES "../*.cpp" "../*.h")

# Skip Teleport example
list(REMOVE_ITEM SOURCES ${TELEPORT_CPP} ${TELEPORT_H})

add_library(audioplugin_examples SHARED ${SOURCES})

target_include_directories(audioplugin_examples PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/..)

if(ANDROID)
    set(ANDROID_API_LEVEL 24)

    target_link_libraries(audioplugin_examples
        android
        log
        stdc++
    )

    set_target_properties(audioplugin_examples PROPERTIES
        LINK_FLAGS "-Wl,--section-start=.note.android.ident=0x4000 -Wl,-z,common-page-size=16384 -Wl,-z,max-page-size=16384"
    )
endif()
