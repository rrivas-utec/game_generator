#!/bin/bash

{
    cmake --build ./build
    ./build/PROYECTO
} || {
    ./build.sh
    cmake --build ./build
    ./build/PROYECTO
}
