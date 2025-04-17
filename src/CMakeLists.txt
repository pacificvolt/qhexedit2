cmake_minimum_required(VERSION 3.16)
project(qhexedit VERSION 0.9.0 LANGUAGES C CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

find_package(QT NAMES Qt5 Qt6 REQUIRED COMPONENTS Core)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Gui Widgets)

qt_standard_project_setup()

qt_add_library(qhexedit
    chunks.cpp chunks.h
    color_manager.cpp color_manager.h
    commands.cpp commands.h
    qhexedit.cpp qhexedit.h
)
target_compile_definitions(qhexedit PUBLIC
    QHEXEDIT_EXPORTS
)

target_link_libraries(qhexedit PUBLIC
    Qt::Core
    Qt::Gui
    Qt::Widgets
)

install(TARGETS qhexedit
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    FRAMEWORK DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
