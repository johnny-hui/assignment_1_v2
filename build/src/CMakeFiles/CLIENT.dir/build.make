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

# Include any dependencies generated for this target.
include src/CMakeFiles/CLIENT.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/CMakeFiles/CLIENT.dir/compiler_depend.make

# Include the progress variables for this target.
include src/CMakeFiles/CLIENT.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/CLIENT.dir/flags.make

src/CMakeFiles/CLIENT.dir/error.c.o: src/CMakeFiles/CLIENT.dir/flags.make
src/CMakeFiles/CLIENT.dir/error.c.o: ../src/error.c
src/CMakeFiles/CLIENT.dir/error.c.o: src/CMakeFiles/CLIENT.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/johnnyhui/Downloads/v4/v4/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/CMakeFiles/CLIENT.dir/error.c.o"
	cd /home/johnnyhui/Downloads/v4/v4/build/src && $(CMAKE_COMMAND) -E __run_co_compile --tidy="clang-tidy;-checks=*,-llvmlibc-restrict-system-libc-headers,-cppcoreguidelines-init-variables,-clang-analyzer-security.insecureAPI.strcpy,-concurrency-mt-unsafe,-android-cloexec-accept,-android-cloexec-dup,-google-readability-todo,-cppcoreguidelines-avoid-magic-numbers,-readability-magic-numbers,-cert-dcl03-c,-hicpp-static-assert,-misc-static-assert,-altera-struct-pack-align,-clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling;--quiet;--extra-arg-before=--driver-mode=gcc" --source=/home/johnnyhui/Downloads/v4/v4/src/error.c -- /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT src/CMakeFiles/CLIENT.dir/error.c.o -MF CMakeFiles/CLIENT.dir/error.c.o.d -o CMakeFiles/CLIENT.dir/error.c.o -c /home/johnnyhui/Downloads/v4/v4/src/error.c

src/CMakeFiles/CLIENT.dir/error.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/CLIENT.dir/error.c.i"
	cd /home/johnnyhui/Downloads/v4/v4/build/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/johnnyhui/Downloads/v4/v4/src/error.c > CMakeFiles/CLIENT.dir/error.c.i

src/CMakeFiles/CLIENT.dir/error.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/CLIENT.dir/error.c.s"
	cd /home/johnnyhui/Downloads/v4/v4/build/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/johnnyhui/Downloads/v4/v4/src/error.c -o CMakeFiles/CLIENT.dir/error.c.s

src/CMakeFiles/CLIENT.dir/conversion.c.o: src/CMakeFiles/CLIENT.dir/flags.make
src/CMakeFiles/CLIENT.dir/conversion.c.o: ../src/conversion.c
src/CMakeFiles/CLIENT.dir/conversion.c.o: src/CMakeFiles/CLIENT.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/johnnyhui/Downloads/v4/v4/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object src/CMakeFiles/CLIENT.dir/conversion.c.o"
	cd /home/johnnyhui/Downloads/v4/v4/build/src && $(CMAKE_COMMAND) -E __run_co_compile --tidy="clang-tidy;-checks=*,-llvmlibc-restrict-system-libc-headers,-cppcoreguidelines-init-variables,-clang-analyzer-security.insecureAPI.strcpy,-concurrency-mt-unsafe,-android-cloexec-accept,-android-cloexec-dup,-google-readability-todo,-cppcoreguidelines-avoid-magic-numbers,-readability-magic-numbers,-cert-dcl03-c,-hicpp-static-assert,-misc-static-assert,-altera-struct-pack-align,-clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling;--quiet;--extra-arg-before=--driver-mode=gcc" --source=/home/johnnyhui/Downloads/v4/v4/src/conversion.c -- /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT src/CMakeFiles/CLIENT.dir/conversion.c.o -MF CMakeFiles/CLIENT.dir/conversion.c.o.d -o CMakeFiles/CLIENT.dir/conversion.c.o -c /home/johnnyhui/Downloads/v4/v4/src/conversion.c

src/CMakeFiles/CLIENT.dir/conversion.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/CLIENT.dir/conversion.c.i"
	cd /home/johnnyhui/Downloads/v4/v4/build/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/johnnyhui/Downloads/v4/v4/src/conversion.c > CMakeFiles/CLIENT.dir/conversion.c.i

src/CMakeFiles/CLIENT.dir/conversion.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/CLIENT.dir/conversion.c.s"
	cd /home/johnnyhui/Downloads/v4/v4/build/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/johnnyhui/Downloads/v4/v4/src/conversion.c -o CMakeFiles/CLIENT.dir/conversion.c.s

src/CMakeFiles/CLIENT.dir/copy.c.o: src/CMakeFiles/CLIENT.dir/flags.make
src/CMakeFiles/CLIENT.dir/copy.c.o: ../src/copy.c
src/CMakeFiles/CLIENT.dir/copy.c.o: src/CMakeFiles/CLIENT.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/johnnyhui/Downloads/v4/v4/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object src/CMakeFiles/CLIENT.dir/copy.c.o"
	cd /home/johnnyhui/Downloads/v4/v4/build/src && $(CMAKE_COMMAND) -E __run_co_compile --tidy="clang-tidy;-checks=*,-llvmlibc-restrict-system-libc-headers,-cppcoreguidelines-init-variables,-clang-analyzer-security.insecureAPI.strcpy,-concurrency-mt-unsafe,-android-cloexec-accept,-android-cloexec-dup,-google-readability-todo,-cppcoreguidelines-avoid-magic-numbers,-readability-magic-numbers,-cert-dcl03-c,-hicpp-static-assert,-misc-static-assert,-altera-struct-pack-align,-clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling;--quiet;--extra-arg-before=--driver-mode=gcc" --source=/home/johnnyhui/Downloads/v4/v4/src/copy.c -- /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT src/CMakeFiles/CLIENT.dir/copy.c.o -MF CMakeFiles/CLIENT.dir/copy.c.o.d -o CMakeFiles/CLIENT.dir/copy.c.o -c /home/johnnyhui/Downloads/v4/v4/src/copy.c

src/CMakeFiles/CLIENT.dir/copy.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/CLIENT.dir/copy.c.i"
	cd /home/johnnyhui/Downloads/v4/v4/build/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/johnnyhui/Downloads/v4/v4/src/copy.c > CMakeFiles/CLIENT.dir/copy.c.i

src/CMakeFiles/CLIENT.dir/copy.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/CLIENT.dir/copy.c.s"
	cd /home/johnnyhui/Downloads/v4/v4/build/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/johnnyhui/Downloads/v4/v4/src/copy.c -o CMakeFiles/CLIENT.dir/copy.c.s

src/CMakeFiles/CLIENT.dir/Client.c.o: src/CMakeFiles/CLIENT.dir/flags.make
src/CMakeFiles/CLIENT.dir/Client.c.o: ../src/Client.c
src/CMakeFiles/CLIENT.dir/Client.c.o: src/CMakeFiles/CLIENT.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/johnnyhui/Downloads/v4/v4/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object src/CMakeFiles/CLIENT.dir/Client.c.o"
	cd /home/johnnyhui/Downloads/v4/v4/build/src && $(CMAKE_COMMAND) -E __run_co_compile --tidy="clang-tidy;-checks=*,-llvmlibc-restrict-system-libc-headers,-cppcoreguidelines-init-variables,-clang-analyzer-security.insecureAPI.strcpy,-concurrency-mt-unsafe,-android-cloexec-accept,-android-cloexec-dup,-google-readability-todo,-cppcoreguidelines-avoid-magic-numbers,-readability-magic-numbers,-cert-dcl03-c,-hicpp-static-assert,-misc-static-assert,-altera-struct-pack-align,-clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling;--quiet;--extra-arg-before=--driver-mode=gcc" --source=/home/johnnyhui/Downloads/v4/v4/src/Client.c -- /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT src/CMakeFiles/CLIENT.dir/Client.c.o -MF CMakeFiles/CLIENT.dir/Client.c.o.d -o CMakeFiles/CLIENT.dir/Client.c.o -c /home/johnnyhui/Downloads/v4/v4/src/Client.c

src/CMakeFiles/CLIENT.dir/Client.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/CLIENT.dir/Client.c.i"
	cd /home/johnnyhui/Downloads/v4/v4/build/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/johnnyhui/Downloads/v4/v4/src/Client.c > CMakeFiles/CLIENT.dir/Client.c.i

src/CMakeFiles/CLIENT.dir/Client.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/CLIENT.dir/Client.c.s"
	cd /home/johnnyhui/Downloads/v4/v4/build/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/johnnyhui/Downloads/v4/v4/src/Client.c -o CMakeFiles/CLIENT.dir/Client.c.s

# Object files for target CLIENT
CLIENT_OBJECTS = \
"CMakeFiles/CLIENT.dir/error.c.o" \
"CMakeFiles/CLIENT.dir/conversion.c.o" \
"CMakeFiles/CLIENT.dir/copy.c.o" \
"CMakeFiles/CLIENT.dir/Client.c.o"

# External object files for target CLIENT
CLIENT_EXTERNAL_OBJECTS =

src/client: src/CMakeFiles/CLIENT.dir/error.c.o
src/client: src/CMakeFiles/CLIENT.dir/conversion.c.o
src/client: src/CMakeFiles/CLIENT.dir/copy.c.o
src/client: src/CMakeFiles/CLIENT.dir/Client.c.o
src/client: src/CMakeFiles/CLIENT.dir/build.make
src/client: src/CMakeFiles/CLIENT.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/johnnyhui/Downloads/v4/v4/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking C executable client"
	cd /home/johnnyhui/Downloads/v4/v4/build/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/CLIENT.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/CLIENT.dir/build: src/client
.PHONY : src/CMakeFiles/CLIENT.dir/build

src/CMakeFiles/CLIENT.dir/clean:
	cd /home/johnnyhui/Downloads/v4/v4/build/src && $(CMAKE_COMMAND) -P CMakeFiles/CLIENT.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/CLIENT.dir/clean

src/CMakeFiles/CLIENT.dir/depend:
	cd /home/johnnyhui/Downloads/v4/v4/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/johnnyhui/Downloads/v4/v4 /home/johnnyhui/Downloads/v4/v4/src /home/johnnyhui/Downloads/v4/v4/build /home/johnnyhui/Downloads/v4/v4/build/src /home/johnnyhui/Downloads/v4/v4/build/src/CMakeFiles/CLIENT.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/CLIENT.dir/depend

