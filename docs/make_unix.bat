#!/bin/bash

# Store the current directory
pushd .

# Set the path to Sphinx build command
SPHINXBUILD="sphinx-build"

# Set source and build directories
SOURCEDIR="source"
BUILDDIR="build"

# Check if Sphinx is installed
command -v $SPHINXBUILD > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "The 'sphinx-build' command was not found. Make sure you have Sphinx installed,"
    echo "then set the SPHINXBUILD environment variable to point to the full path of the"
    echo "'sphinx-build' executable. Alternatively, you may add the Sphinx directory to PATH."
    echo "If you don't have Sphinx installed, you can get it from https://www.sphinx-doc.org/"
    exit 1
fi

# Check for arguments
if [ "$1" == "" ]; then
    $SPHINXBUILD -M help $SOURCEDIR $BUILDDIR $SPHINXOPTS $O
else
    $SPHINXBUILD -M $1 $SOURCEDIR $BUILDDIR $SPHINXOPTS $O
fi

# Restore the original directory
popd
