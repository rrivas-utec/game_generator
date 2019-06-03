cmake_minimum_required(VERSION 3.0)

project(game)

set(SOURCE game.cpp)
set(CMAKE_VERBOSE_MAKEFILE ON)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

add_executable(${PROJECT_NAME} ${SOURCE})

set( CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} /usr/share/SFML/cmake/Modules )
find_package( SFML 2 REQUIRED graphics window system )
if (SFML_FOUND)

    target_link_libraries(${PROJECT_NAME} ${SFML_LIBRARIES} ${SFML_DEPENDENCIES})    
endif()
