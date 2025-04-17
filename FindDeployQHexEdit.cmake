function( DeployQHexEdit target)
    message( STATUS "Deploy DeployQHexEdit for ${target}" )

    add_custom_command(TARGET ${target} POST_BUILD
        COMMAND "${CMAKE_COMMAND}" -E echo "Deploying QHexEdit2 Library '$<TARGET_FILE_NAME:qhexedit>' for '${target}'"
        COMMAND "${CMAKE_COMMAND}" -E copy_if_different "$<TARGET_FILE:qhexedit>" \"$<TARGET_FILE_DIR:${target}>\"
    )
endfunction()

