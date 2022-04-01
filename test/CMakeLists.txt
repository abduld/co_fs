cmake_minimum_required(VERSION 3.14)

project(co_fsTests LANGUAGES CXX)

include(../cmake/project-is-top-level.cmake)
include(../cmake/folders.cmake)
include(../cmake/windows-set-path.cmake)

# ---- Dependencies ----

if(PROJECT_IS_TOP_LEVEL)
  find_package(co_fs REQUIRED)
  enable_testing()
endif()

# ---- Tests ----

add_executable(co_fs_test source/co_fs_test.cpp)
target_link_libraries(co_fs_test PRIVATE co_fs::co_fs)
target_compile_features(co_fs_test PRIVATE cxx_std_17)

add_test(NAME co_fs_test COMMAND co_fs_test)

# ---- End-of-file commands ----

add_folders(Test)
