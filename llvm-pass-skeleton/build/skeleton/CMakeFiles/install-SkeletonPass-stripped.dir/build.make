# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.27

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
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.27.8/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.27.8/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/veerendragottiveeti/Desktop/llvm-pass-skeleton

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/veerendragottiveeti/Desktop/llvm-pass-skeleton/build

# Utility rule file for install-SkeletonPass-stripped.

# Include any custom commands dependencies for this target.
include skeleton/CMakeFiles/install-SkeletonPass-stripped.dir/compiler_depend.make

# Include the progress variables for this target.
include skeleton/CMakeFiles/install-SkeletonPass-stripped.dir/progress.make

skeleton/CMakeFiles/install-SkeletonPass-stripped:
	cd /Users/veerendragottiveeti/Desktop/llvm-pass-skeleton/build/skeleton && /opt/homebrew/Cellar/cmake/3.27.8/bin/cmake -DCMAKE_INSTALL_COMPONENT="SkeletonPass" -DCMAKE_INSTALL_DO_STRIP=1 -P /Users/veerendragottiveeti/Desktop/llvm-pass-skeleton/build/cmake_install.cmake

install-SkeletonPass-stripped: skeleton/CMakeFiles/install-SkeletonPass-stripped
install-SkeletonPass-stripped: skeleton/CMakeFiles/install-SkeletonPass-stripped.dir/build.make
.PHONY : install-SkeletonPass-stripped

# Rule to build all files generated by this target.
skeleton/CMakeFiles/install-SkeletonPass-stripped.dir/build: install-SkeletonPass-stripped
.PHONY : skeleton/CMakeFiles/install-SkeletonPass-stripped.dir/build

skeleton/CMakeFiles/install-SkeletonPass-stripped.dir/clean:
	cd /Users/veerendragottiveeti/Desktop/llvm-pass-skeleton/build/skeleton && $(CMAKE_COMMAND) -P CMakeFiles/install-SkeletonPass-stripped.dir/cmake_clean.cmake
.PHONY : skeleton/CMakeFiles/install-SkeletonPass-stripped.dir/clean

skeleton/CMakeFiles/install-SkeletonPass-stripped.dir/depend:
	cd /Users/veerendragottiveeti/Desktop/llvm-pass-skeleton/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/veerendragottiveeti/Desktop/llvm-pass-skeleton /Users/veerendragottiveeti/Desktop/llvm-pass-skeleton/skeleton /Users/veerendragottiveeti/Desktop/llvm-pass-skeleton/build /Users/veerendragottiveeti/Desktop/llvm-pass-skeleton/build/skeleton /Users/veerendragottiveeti/Desktop/llvm-pass-skeleton/build/skeleton/CMakeFiles/install-SkeletonPass-stripped.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : skeleton/CMakeFiles/install-SkeletonPass-stripped.dir/depend

