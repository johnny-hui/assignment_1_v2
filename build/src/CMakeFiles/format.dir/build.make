# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/johnnyhui/Downloads/v4/v4

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/johnnyhui/Downloads/v4/v4/build

# Utility rule file for format.

# Include any custom commands dependencies for this target.
include src/CMakeFiles/format.dir/compiler_depend.make

# Include the progress variables for this target.
include src/CMakeFiles/format.dir/progress.make

src/CMakeFiles/format:
	cd /home/johnnyhui/Downloads/v4/v4/build/src && clang-format -i /home/johnnyhui/Downloads/v4/v4/include/error.h /home/johnnyhui/Downloads/v4/v4/include/conversion.h /home/johnnyhui/Downloads/v4/v4/include/copy.h /home/johnnyhui/Downloads/v4/v4/src/error.c /home/johnnyhui/Downloads/v4/v4/src/conversion.c /home/johnnyhui/Downloads/v4/v4/src/copy.c /home/johnnyhui/Downloads/v4/v4/src/Server.c /home/johnnyhui/Downloads/v4/v4/src/Client.c

format: src/CMakeFiles/format
format: src/CMakeFiles/format.dir/build.make
.PHONY : format

# Rule to build all files generated by this target.
src/CMakeFiles/format.dir/build: format
.PHONY : src/CMakeFiles/format.dir/build

src/CMakeFiles/format.dir/clean:
	cd /home/johnnyhui/Downloads/v4/v4/build/src && $(CMAKE_COMMAND) -P CMakeFiles/format.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/format.dir/clean

src/CMakeFiles/format.dir/depend:
	cd /home/johnnyhui/Downloads/v4/v4/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/johnnyhui/Downloads/v4/v4 /home/johnnyhui/Downloads/v4/v4/src /home/johnnyhui/Downloads/v4/v4/build /home/johnnyhui/Downloads/v4/v4/build/src /home/johnnyhui/Downloads/v4/v4/build/src/CMakeFiles/format.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/format.dir/depend

