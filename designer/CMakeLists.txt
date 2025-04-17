cmake_minimum_required(VERSION 3.16)
project(qhexedit_designer VERSION 1.0 LANGUAGES C CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

find_package(QT NAMES Qt5 Qt6 REQUIRED COMPONENTS Core)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Designer Gui)
find_package(DeployQHexEdit REQUIRED)

qt_standard_project_setup()

qt_add_plugin(qhexedit_designer
    QHexEditPlugin.cpp QHexEditPlugin.h
)
target_include_directories(qhexedit_designer PRIVATE
    ../src
)

target_link_libraries(qhexedit_designer PRIVATE
    Qt::Core
    Qt::Designer
    Qt::Gui
    qhexedit
)

DeployQHexEdit( qhexedit_designer . )

install(TARGETS qhexedit_designer
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    FRAMEWORK DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
