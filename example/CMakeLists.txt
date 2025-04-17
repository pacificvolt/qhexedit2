cmake_minimum_required(VERSION 3.16)
project(example VERSION 1.0 LANGUAGES C CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOUIC ON)

find_package(QT NAMES Qt5 Qt6 REQUIRED COMPONENTS Core)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Gui Widgets)
find_package(DeployQHexEdit REQUIRED)
qt_standard_project_setup()

qt_add_executable(example WIN32 MACOSX_BUNDLE
    main.cpp
    mainwindow.cpp mainwindow.h
    optionsdialog.cpp optionsdialog.h optionsdialog.ui
    searchdialog.cpp searchdialog.h searchdialog.ui
)

target_link_libraries(example PRIVATE
    Qt::Core
    Qt::Gui
    Qt::Widgets
    qhexedit
)

target_include_directories( example PRIVATE ${CMAKE_SOURCE_DIR}/src )


# Resources:
set(example_resource_files
    "images/find.png"
    "images/open.png"
    "images/qhexedit.ico"
    "images/redo.png"
    "images/save.png"
    "images/undo.png"
    "translations/qhexedit_cs.qm"
    "translations/qhexedit_de.qm"
    "translations/qhexedit_es.qm"
    "translations/qhexedit_fr.qm"
    "translations/qhexedit_it.qm"
    "translations/qhexedit_ru.qm"
)

qt_add_resources(example "example"
    PREFIX
        "/"
    FILES
        ${example_resource_files}
)

install(TARGETS example
    BUNDLE DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

qt_generate_deploy_app_script(
    TARGET example
    FILENAME_VARIABLE deploy_script
    NO_UNSUPPORTED_PLATFORM_ERROR
)
install(SCRIPT ${deploy_script})
DeployQHexEdit( example . )