cmake_minimum_required(VERSION 3.13)
project(game)

# Archivos del Projecto
set(PROJECT_SOURCE
        main.cpp
    )

# C++ Standard se sugiere 11 ó 14
set(CMAKE_CXX_STANDARD 14)

set(SFML_ROOT "~/Libraries/SFML")

set(SFML_INCLUDE_DIR "${SFML_ROOT}/include")
set(SFML_LIBRARY_DIR "${SFML_ROOT}/lib")
set(SFML_DIR "${SFML_ROOT}/lib/cmake/SFML")
link_directories(SFML_LIBRARY_DIR)
include_directories(SFML_INCLUDE_DIR)

# Instrucciones para generar el ejecutable
add_executable(${PROJECT_NAME} ${PROJECT_SOURCE})

find_package(SFML 2.5.1
        COMPONENTS
            system
            window
            graphics
        REQUIRED)

target_link_libraries (${PROJECT_NAME}
        sfml-system
        sfml-window
        sfml-graphics
        )
