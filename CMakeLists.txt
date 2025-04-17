cmake_minimum_required(VERSION 3.22)

project(qhexedit2
    VERSION 0.9.0 
    DESCRIPTION "QHexEdit is a hex editor widget written in C++ for the Qt (Qt5, Qt6) framework."
    HOMEPAGE_URL https://github.com/Simsys/qhexedit2
    ) 

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED true)

set_property( GLOBAL PROPERTY USE_FOLDERS ON )
SET(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR} ${CMAKE_MODULE_PATH})

add_subdirectory( designer )
add_subdirectory( example )
add_subdirectory( src ) 
