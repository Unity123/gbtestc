cmake_minimum_required (VERSION 3.1.4)
project (main C)

SET(CMAKE_EXPORT_COMPILE_COMMANDS 1)
SET(CMAKE_C_COMPILER "gcc")
SET(CMAKE_C_STANDARD_INCLUDE_DIRECTORIES ${CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES})
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -O0")
set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -O0")

execute_process(COMMAND bash ${CMAKE_CURRENT_SOURCE_DIR}/getdeps.sh
WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/
COMMAND_ECHO STDOUT)

include_directories(include)
file(GLOB_RECURSE SRC src/*.c)
add_executable(main ${SRC})

find_package(Z80 REQUIRED Shared)
target_link_libraries(main PRIVATE Z80)

find_package(SDL2 REQUIRED CONFIG REQUIRED COMPONENTS SDL2)
find_package(SDL2 REQUIRED CONFIG COMPONENTS SDL2main)

if(TARGET SDL2::SDL2main)
    target_link_libraries(main PRIVATE SDL2::SDL2main)
endif()

target_link_libraries(main PRIVATE SDL2::SDL2)

add_custom_target(
	copy-compile-commands ALL
	${CMAKE_COMMAND} -E copy_if_different
	${CMAKE_BINARY_DIR}/compile_commands.json
	${CMAKE_CURRENT_LIST_DIR}
)
