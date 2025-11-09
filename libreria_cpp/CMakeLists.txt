cmake_minimum_required(VERSION 3.10)
project(DNIUtilsProject LANGUAGES CXX)

# ----------------------
# C++ Standard
# ----------------------
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


if (MSVC)
    add_compile_options(/W4)
else()
    add_compile_options(-Wall -Wextra -pedantic)
endif()


add_library(dni_utils SHARED
    src/dni_utils.cpp
)

target_include_directories(dni_utils PUBLIC
    ${PROJECT_SOURCE_DIR}/src
)

target_compile_definitions(dni_utils PRIVATE BUILDING_DNI_LIB)

add_executable(dni_validator
    client/prueba.cpp
)

target_link_libraries(dni_validator PRIVATE dni_utils)

set_target_properties(dni_utils PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/Release
    LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/Release
    ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/Release
)

set_target_properties(dni_validator PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/Release
)
