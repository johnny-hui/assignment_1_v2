# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.23

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
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "/Users/Johnny/Desktop/assignment_1_v2 2"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/Users/Johnny/Desktop/assignment_1_v2 2/cmake-build-debug"

# Include any dependencies generated for this target.
include src/CMakeFiles/SERVER.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/CMakeFiles/SERVER.dir/compiler_depend.make

# Include the progress variables for this target.
include src/CMakeFiles/SERVER.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/SERVER.dir/flags.make

src/CMakeFiles/SERVER.dir/error.c.o: src/CMakeFiles/SERVER.dir/flags.make
src/CMakeFiles/SERVER.dir/error.c.o: ../src/error.c
src/CMakeFiles/SERVER.dir/error.c.o: src/CMakeFiles/SERVER.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/Johnny/Desktop/assignment_1_v2 2/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/CMakeFiles/SERVER.dir/error.c.o"
	cd "/Users/Johnny/Desktop/assignment_1_v2 2/cmake-build-debug/src" && $(CMAKE_COMMAND) -E __run_co_compile --tidy="clang-tidy;-checks=*,-llvmlibc-restrict-system-libc-headers,-cppcoreguidelines-init-variables,-clang-analyzer-security.insecureAPI.strcpy,-concurrency-mt-unsafe,-android-cloexec-accept,-android-cloexec-dup,-google-readability-todo,-cppcoreguidelines-avoid-magic-numbers,-readability-magic-numbers,-cert-dcl03-c,-hicpp-static-assert,-misc-static-assert,-altera-struct-pack-align,-clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling;--quiet;--extra-arg-before=--driver-mode=gcc" --source="/Users/Johnny/Desktop/assignment_1_v2 2/src/error.c" -- /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT src/CMakeFiles/SERVER.dir/error.c.o -MF CMakeFiles/SERVER.dir/error.c.o.d -o CMakeFiles/SERVER.dir/error.c.o -c "/Users/Johnny/Desktop/assignment_1_v2 2/src/error.c"

src/CMakeFiles/SERVER.dir/error.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/SERVER.dir/error.c.i"
	cd "/Users/Johnny/Desktop/assignment_1_v2 2/cmake-build-debug/src" && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/Users/Johnny/Desktop/assignment_1_v2 2/src/error.c" > CMakeFiles/SERVER.dir/error.c.i

src/CMakeFiles/SERVER.dir/error.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/SERVER.dir/error.c.s"
	cd "/Users/Johnny/Desktop/assignment_1_v2 2/cmake-build-debug/src" && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/Users/Johnny/Desktop/assignment_1_v2 2/src/error.c" -o CMakeFiles/SERVER.dir/error.c.s

src/CMakeFiles/SERVER.dir/conversion.c.o: src/CMakeFiles/SERVER.dir/flags.make
src/CMakeFiles/SERVER.dir/conversion.c.o: ../src/conversion.c
src/CMakeFiles/SERVER.dir/conversion.c.o: src/CMakeFiles/SERVER.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/Johnny/Desktop/assignment_1_v2 2/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Building C object src/CMakeFiles/SERVER.dir/conversion.c.o"
	cd "/Users/Johnny/Desktop/assignment_1_v2 2/cmake-build-debug/src" && $(CMAKE_COMMAND) -E __run_co_compile --tidy="clang-tidy;-checks=*,-llvmlibc-restrict-system-libc-headers,-cppcoreguidelines-init-variables,-clang-analyzer-security.insecureAPI.strcpy,-concurrency-mt-unsafe,-android-cloexec-accept,-android-cloexec-dup,-google-readability-todo,-cppcoreguidelines-avoid-magic-numbers,-readability-magic-numbers,-cert-dcl03-c,-hicpp-static-assert,-misc-static-assert,-altera-struct-pack-align,-clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling;--quiet;--extra-arg-before=--driver-mode=gcc" --source="/Users/Johnny/Desktop/assignment_1_v2 2/src/conversion.c" -- /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT src/CMakeFiles/SERVER.dir/conversion.c.o -MF CMakeFiles/SERVER.dir/conversion.c.o.d -o CMakeFiles/SERVER.dir/conversion.c.o -c "/Users/Johnny/Desktop/assignment_1_v2 2/src/conversion.c"

src/CMakeFiles/SERVER.dir/conversion.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/SERVER.dir/conversion.c.i"
	cd "/Users/Johnny/Desktop/assignment_1_v2 2/cmake-build-debug/src" && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/Users/Johnny/Desktop/assignment_1_v2 2/src/conversion.c" > CMakeFiles/SERVER.dir/conversion.c.i

src/CMakeFiles/SERVER.dir/conversion.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/SERVER.dir/conversion.c.s"
	cd "/Users/Johnny/Desktop/assignment_1_v2 2/cmake-build-debug/src" && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/Users/Johnny/Desktop/assignment_1_v2 2/src/conversion.c" -o CMakeFiles/SERVER.dir/conversion.c.s

src/CMakeFiles/SERVER.dir/copy.c.o: src/CMakeFiles/SERVER.dir/flags.make
src/CMakeFiles/SERVER.dir/copy.c.o: ../src/copy.c
src/CMakeFiles/SERVER.dir/copy.c.o: src/CMakeFiles/SERVER.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/Johnny/Desktop/assignment_1_v2 2/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_3) "Building C object src/CMakeFiles/SERVER.dir/copy.c.o"
	cd "/Users/Johnny/Desktop/assignment_1_v2 2/cmake-build-debug/src" && $(CMAKE_COMMAND) -E __run_co_compile --tidy="clang-tidy;-checks=*,-llvmlibc-restrict-system-libc-headers,-cppcoreguidelines-init-variables,-clang-analyzer-security.insecureAPI.strcpy,-concurrency-mt-unsafe,-android-cloexec-accept,-android-cloexec-dup,-google-readability-todo,-cppcoreguidelines-avoid-magic-numbers,-readability-magic-numbers,-cert-dcl03-c,-hicpp-static-assert,-misc-static-assert,-altera-struct-pack-align,-clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling;--quiet;--extra-arg-before=--driver-mode=gcc" --source="/Users/Johnny/Desktop/assignment_1_v2 2/src/copy.c" -- /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT src/CMakeFiles/SERVER.dir/copy.c.o -MF CMakeFiles/SERVER.dir/copy.c.o.d -o CMakeFiles/SERVER.dir/copy.c.o -c "/Users/Johnny/Desktop/assignment_1_v2 2/src/copy.c"

src/CMakeFiles/SERVER.dir/copy.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/SERVER.dir/copy.c.i"
	cd "/Users/Johnny/Desktop/assignment_1_v2 2/cmake-build-debug/src" && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/Users/Johnny/Desktop/assignment_1_v2 2/src/copy.c" > CMakeFiles/SERVER.dir/copy.c.i

src/CMakeFiles/SERVER.dir/copy.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/SERVER.dir/copy.c.s"
	cd "/Users/Johnny/Desktop/assignment_1_v2 2/cmake-build-debug/src" && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/Users/Johnny/Desktop/assignment_1_v2 2/src/copy.c" -o CMakeFiles/SERVER.dir/copy.c.s

src/CMakeFiles/SERVER.dir/Server.c.o: src/CMakeFiles/SERVER.dir/flags.make
src/CMakeFiles/SERVER.dir/Server.c.o: ../src/Server.c
src/CMakeFiles/SERVER.dir/Server.c.o: src/CMakeFiles/SERVER.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/Johnny/Desktop/assignment_1_v2 2/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_4) "Building C object src/CMakeFiles/SERVER.dir/Server.c.o"
	cd "/Users/Johnny/Desktop/assignment_1_v2 2/cmake-build-debug/src" && $(CMAKE_COMMAND) -E __run_co_compile --tidy="clang-tidy;-checks=*,-llvmlibc-restrict-system-libc-headers,-cppcoreguidelines-init-variables,-clang-analyzer-security.insecureAPI.strcpy,-concurrency-mt-unsafe,-android-cloexec-accept,-android-cloexec-dup,-google-readability-todo,-cppcoreguidelines-avoid-magic-numbers,-readability-magic-numbers,-cert-dcl03-c,-hicpp-static-assert,-misc-static-assert,-altera-struct-pack-align,-clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling;--quiet;--extra-arg-before=--driver-mode=gcc" --source="/Users/Johnny/Desktop/assignment_1_v2 2/src/Server.c" -- /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT src/CMakeFiles/SERVER.dir/Server.c.o -MF CMakeFiles/SERVER.dir/Server.c.o.d -o CMakeFiles/SERVER.dir/Server.c.o -c "/Users/Johnny/Desktop/assignment_1_v2 2/src/Server.c"

src/CMakeFiles/SERVER.dir/Server.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/SERVER.dir/Server.c.i"
	cd "/Users/Johnny/Desktop/assignment_1_v2 2/cmake-build-debug/src" && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/Users/Johnny/Desktop/assignment_1_v2 2/src/Server.c" > CMakeFiles/SERVER.dir/Server.c.i

src/CMakeFiles/SERVER.dir/Server.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/SERVER.dir/Server.c.s"
	cd "/Users/Johnny/Desktop/assignment_1_v2 2/cmake-build-debug/src" && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/Users/Johnny/Desktop/assignment_1_v2 2/src/Server.c" -o CMakeFiles/SERVER.dir/Server.c.s

# Object files for target SERVER
SERVER_OBJECTS = \
"CMakeFiles/SERVER.dir/error.c.o" \
"CMakeFiles/SERVER.dir/conversion.c.o" \
"CMakeFiles/SERVER.dir/copy.c.o" \
"CMakeFiles/SERVER.dir/Server.c.o"

# External object files for target SERVER
SERVER_EXTERNAL_OBJECTS =

src/server: src/CMakeFiles/SERVER.dir/error.c.o
src/server: src/CMakeFiles/SERVER.dir/conversion.c.o
src/server: src/CMakeFiles/SERVER.dir/copy.c.o
src/server: src/CMakeFiles/SERVER.dir/Server.c.o
src/server: src/CMakeFiles/SERVER.dir/build.make
src/server: src/CMakeFiles/SERVER.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/Users/Johnny/Desktop/assignment_1_v2 2/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_5) "Linking C executable server"
	cd "/Users/Johnny/Desktop/assignment_1_v2 2/cmake-build-debug/src" && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/SERVER.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/SERVER.dir/build: src/server
.PHONY : src/CMakeFiles/SERVER.dir/build

src/CMakeFiles/SERVER.dir/clean:
	cd "/Users/Johnny/Desktop/assignment_1_v2 2/cmake-build-debug/src" && $(CMAKE_COMMAND) -P CMakeFiles/SERVER.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/SERVER.dir/clean

src/CMakeFiles/SERVER.dir/depend:
	cd "/Users/Johnny/Desktop/assignment_1_v2 2/cmake-build-debug" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/Users/Johnny/Desktop/assignment_1_v2 2" "/Users/Johnny/Desktop/assignment_1_v2 2/src" "/Users/Johnny/Desktop/assignment_1_v2 2/cmake-build-debug" "/Users/Johnny/Desktop/assignment_1_v2 2/cmake-build-debug/src" "/Users/Johnny/Desktop/assignment_1_v2 2/cmake-build-debug/src/CMakeFiles/SERVER.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : src/CMakeFiles/SERVER.dir/depend

