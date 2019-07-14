cmake_minimum_required(VERSION 3.13)
project(game)

# Archivos del Projecto
set(PROJECT_SOURCE
        main.cpp
    )

# C++ Standard se sugiere 11 ó 14
set(CMAKE_CXX_STANDARD 14)

if (WIN32)
    # Valido solo para WINDOWS en LINUX o OSX no debe de cambiarse
    # Modificar al folder donde se encuentre la libreria SFML instalada en su PC
    set(SFML_ROOT "C:/shared/SFML-2.5.1") # <--------- Modificar SOLO AQUI

    set(SFML_INCLUDE_DIR "${SFML_ROOT}/include")
    set(SFML_LIBRARY_DIR "${SFML_ROOT}/lib")
    set(SFML_DIR "${SFML_ROOT}/lib/cmake/SFML")
    link_directories(SFML_LIBRARY_DIR)
    include_directories(SFML_INCLUDE_DIR)
endif()

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