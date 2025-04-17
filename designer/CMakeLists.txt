cmake_minimum_required(VERSION 3.16)
project(designer VERSION 1.0 LANGUAGES C CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

find_package(QT NAMES Qt5 Qt6 REQUIRED COMPONENTS Core)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Designer Gui)

qt_standard_project_setup()

qt_add_plugin(designer
    QHexEditPlugin.cpp QHexEditPlugin.h
)
target_include_directories(designer PRIVATE
    ../src
)

target_link_libraries(designer PRIVATE
    Qt::Core
    Qt::Designer
    Qt::Gui
)

install(TARGETS designer
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    FRAMEWORK DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
