# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/dagoodma/Documents/ESESC/esesc

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/dagoodma/Documents/ESESC/esesc

# Include any dependencies generated for this target.
include t/gtest-1.7.0/CMakeFiles/gtest.dir/depend.make

# Include the progress variables for this target.
include t/gtest-1.7.0/CMakeFiles/gtest.dir/progress.make

# Include the compile flags for this target's objects.
include t/gtest-1.7.0/CMakeFiles/gtest.dir/flags.make

t/gtest-1.7.0/CMakeFiles/gtest.dir/src/gtest-all.cc.o: t/gtest-1.7.0/CMakeFiles/gtest.dir/flags.make
t/gtest-1.7.0/CMakeFiles/gtest.dir/src/gtest-all.cc.o: t/gtest-1.7.0/src/gtest-all.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/dagoodma/Documents/ESESC/esesc/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object t/gtest-1.7.0/CMakeFiles/gtest.dir/src/gtest-all.cc.o"
	cd /home/dagoodma/Documents/ESESC/esesc/t/gtest-1.7.0 && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -g -pipe -Wno-deprecated -Wall -Wall -Wshadow -DGTEST_HAS_PTHREAD=1 -fexceptions -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -o CMakeFiles/gtest.dir/src/gtest-all.cc.o -c /home/dagoodma/Documents/ESESC/esesc/t/gtest-1.7.0/src/gtest-all.cc

t/gtest-1.7.0/CMakeFiles/gtest.dir/src/gtest-all.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gtest.dir/src/gtest-all.cc.i"
	cd /home/dagoodma/Documents/ESESC/esesc/t/gtest-1.7.0 && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -g -pipe -Wno-deprecated -Wall -Wall -Wshadow -DGTEST_HAS_PTHREAD=1 -fexceptions -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -E /home/dagoodma/Documents/ESESC/esesc/t/gtest-1.7.0/src/gtest-all.cc > CMakeFiles/gtest.dir/src/gtest-all.cc.i

t/gtest-1.7.0/CMakeFiles/gtest.dir/src/gtest-all.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gtest.dir/src/gtest-all.cc.s"
	cd /home/dagoodma/Documents/ESESC/esesc/t/gtest-1.7.0 && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -g -pipe -Wno-deprecated -Wall -Wall -Wshadow -DGTEST_HAS_PTHREAD=1 -fexceptions -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -S /home/dagoodma/Documents/ESESC/esesc/t/gtest-1.7.0/src/gtest-all.cc -o CMakeFiles/gtest.dir/src/gtest-all.cc.s

t/gtest-1.7.0/CMakeFiles/gtest.dir/src/gtest-all.cc.o.requires:
.PHONY : t/gtest-1.7.0/CMakeFiles/gtest.dir/src/gtest-all.cc.o.requires

t/gtest-1.7.0/CMakeFiles/gtest.dir/src/gtest-all.cc.o.provides: t/gtest-1.7.0/CMakeFiles/gtest.dir/src/gtest-all.cc.o.requires
	$(MAKE) -f t/gtest-1.7.0/CMakeFiles/gtest.dir/build.make t/gtest-1.7.0/CMakeFiles/gtest.dir/src/gtest-all.cc.o.provides.build
.PHONY : t/gtest-1.7.0/CMakeFiles/gtest.dir/src/gtest-all.cc.o.provides

t/gtest-1.7.0/CMakeFiles/gtest.dir/src/gtest-all.cc.o.provides.build: t/gtest-1.7.0/CMakeFiles/gtest.dir/src/gtest-all.cc.o

# Object files for target gtest
gtest_OBJECTS = \
"CMakeFiles/gtest.dir/src/gtest-all.cc.o"

# External object files for target gtest
gtest_EXTERNAL_OBJECTS =

t/gtest-1.7.0/libgtest.a: t/gtest-1.7.0/CMakeFiles/gtest.dir/src/gtest-all.cc.o
t/gtest-1.7.0/libgtest.a: t/gtest-1.7.0/CMakeFiles/gtest.dir/build.make
t/gtest-1.7.0/libgtest.a: t/gtest-1.7.0/CMakeFiles/gtest.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX static library libgtest.a"
	cd /home/dagoodma/Documents/ESESC/esesc/t/gtest-1.7.0 && $(CMAKE_COMMAND) -P CMakeFiles/gtest.dir/cmake_clean_target.cmake
	cd /home/dagoodma/Documents/ESESC/esesc/t/gtest-1.7.0 && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gtest.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
t/gtest-1.7.0/CMakeFiles/gtest.dir/build: t/gtest-1.7.0/libgtest.a
.PHONY : t/gtest-1.7.0/CMakeFiles/gtest.dir/build

t/gtest-1.7.0/CMakeFiles/gtest.dir/requires: t/gtest-1.7.0/CMakeFiles/gtest.dir/src/gtest-all.cc.o.requires
.PHONY : t/gtest-1.7.0/CMakeFiles/gtest.dir/requires

t/gtest-1.7.0/CMakeFiles/gtest.dir/clean:
	cd /home/dagoodma/Documents/ESESC/esesc/t/gtest-1.7.0 && $(CMAKE_COMMAND) -P CMakeFiles/gtest.dir/cmake_clean.cmake
.PHONY : t/gtest-1.7.0/CMakeFiles/gtest.dir/clean

t/gtest-1.7.0/CMakeFiles/gtest.dir/depend:
	cd /home/dagoodma/Documents/ESESC/esesc && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/dagoodma/Documents/ESESC/esesc /home/dagoodma/Documents/ESESC/esesc/t/gtest-1.7.0 /home/dagoodma/Documents/ESESC/esesc /home/dagoodma/Documents/ESESC/esesc/t/gtest-1.7.0 /home/dagoodma/Documents/ESESC/esesc/t/gtest-1.7.0/CMakeFiles/gtest.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : t/gtest-1.7.0/CMakeFiles/gtest.dir/depend
