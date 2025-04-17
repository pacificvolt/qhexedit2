cmake_minimum_required(VERSION 3.16)
project(chunks VERSION 1.0 LANGUAGES C CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

find_package(QT NAMES Qt5 Qt6 REQUIRED COMPONENTS Core)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Gui)

qt_standard_project_setup()

qt_add_executable(chunks WIN32 MACOSX_BUNDLE
    ../src/chunks.cpp ../src/chunks.h
    main.cpp
    testchunks.cpp testchunks.h
)
target_compile_definitions(chunks PRIVATE
    MODUL_TEST
)

target_link_libraries(chunks PRIVATE
    Qt::Core
    Qt::Gui
)

install(TARGETS chunks
    BUNDLE DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

qt_generate_deploy_app_script(
    TARGET chunks
    FILENAME_VARIABLE deploy_script
    NO_UNSUPPORTED_PLATFORM_ERROR
)
install(SCRIPT ${deploy_script})
