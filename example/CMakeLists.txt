cmake_minimum_required(VERSION 3.16)
project(qhexedit VERSION 1.0 LANGUAGES C CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOUIC ON)

find_package(QT NAMES Qt5 Qt6 REQUIRED COMPONENTS Core)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Gui Widgets)

qt_standard_project_setup()

qt_add_executable(qhexedit WIN32 MACOSX_BUNDLE
    ../src/chunks.cpp ../src/chunks.h
    ../src/color_manager.cpp ../src/color_manager.h
    ../src/commands.cpp ../src/commands.h
    ../src/qhexedit.cpp ../src/qhexedit.h
    main.cpp
    mainwindow.cpp mainwindow.h
    optionsdialog.cpp optionsdialog.h optionsdialog.ui
    searchdialog.cpp searchdialog.h searchdialog.ui
)
target_compile_definitions(qhexedit PRIVATE
    QHEXEDIT_EXPORTS
)

target_link_libraries(qhexedit PRIVATE
    Qt::Core
    Qt::Gui
    Qt::Widgets
)


# Resources:
set(qhexedit_resource_files
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

qt_add_resources(qhexedit "qhexedit"
    PREFIX
        "/"
    FILES
        ${qhexedit_resource_files}
)

install(TARGETS qhexedit
    BUNDLE DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

qt_generate_deploy_app_script(
    TARGET qhexedit
    FILENAME_VARIABLE deploy_script
    NO_UNSUPPORTED_PLATFORM_ERROR
)
install(SCRIPT ${deploy_script})
