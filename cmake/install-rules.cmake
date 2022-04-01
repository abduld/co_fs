if(PROJECT_IS_TOP_LEVEL)
  set(CMAKE_INSTALL_INCLUDEDIR include/co_fs CACHE PATH "")
endif()

# Project is configured with no languages, so tell GNUInstallDirs the lib dir
set(CMAKE_INSTALL_LIBDIR lib CACHE PATH "")

include(CMakePackageConfigHelpers)
include(GNUInstallDirs)

# find_package(<package>) call for consumers to find this project
set(package co_fs)

install(
    DIRECTORY include/
    DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
    COMPONENT co_fs_Development
)

install(
    TARGETS co_fs_co_fs
    EXPORT co_fsTargets
    INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
)

write_basic_package_version_file(
    "${package}ConfigVersion.cmake"
    COMPATIBILITY SameMajorVersion
    ARCH_INDEPENDENT
)

# Allow package maintainers to freely override the path for the configs
set(
    co_fs_INSTALL_CMAKEDIR "${CMAKE_INSTALL_DATADIR}/${package}"
    CACHE PATH "CMake package config location relative to the install prefix"
)
mark_as_advanced(co_fs_INSTALL_CMAKEDIR)

install(
    FILES cmake/install-config.cmake
    DESTINATION "${co_fs_INSTALL_CMAKEDIR}"
    RENAME "${package}Config.cmake"
    COMPONENT co_fs_Development
)

install(
    FILES "${PROJECT_BINARY_DIR}/${package}ConfigVersion.cmake"
    DESTINATION "${co_fs_INSTALL_CMAKEDIR}"
    COMPONENT co_fs_Development
)

install(
    EXPORT co_fsTargets
    NAMESPACE co_fs::
    DESTINATION "${co_fs_INSTALL_CMAKEDIR}"
    COMPONENT co_fs_Development
)

if(PROJECT_IS_TOP_LEVEL)
  include(CPack)
endif()
