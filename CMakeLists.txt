cmake_minimum_required(VERSION 3.10)

project(EnterpriseDevOpsCalculator)

set(CMAKE_CXX_STANDARD 17)

add_executable(calculator
    app/main.cpp
    app/calculator.cpp
)
