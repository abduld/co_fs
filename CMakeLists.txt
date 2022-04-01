cmake_minimum_required(VERSION 3.14)

include(cmake/prelude.cmake)

project(
    co_fs
    VERSION 0.1.0
    DESCRIPTION "Short description"
    HOMEPAGE_URL "https://example.com/"
    LANGUAGES NONE
)

include(cmake/project-is-top-level.cmake)
include(cmake/variables.cmake)

# ---- Declare library ----

add_library(co_fs_co_fs INTERFACE)
add_library(co_fs::co_fs ALIAS co_fs_co_fs)

set_property(
    TARGET co_fs_co_fs PROPERTY
    EXPORT_NAME co_fs
)

target_include_directories(
    co_fs_co_fs ${warning_guard}
    INTERFACE
    "$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>"
)

target_compile_features(co_fs_co_fs INTERFACE cxx_std_20)

# ---- Install rules ----

if(NOT CMAKE_SKIP_INSTALL_RULES)
  include(cmake/install-rules.cmake)
endif()

# ---- Developer mode ----

if(NOT co_fs_DEVELOPER_MODE)
  return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
  message(
      AUTHOR_WARNING
      "Developer mode is intended for developers of co_fs"
  )
endif()

include(cmake/dev-mode.cmake)
