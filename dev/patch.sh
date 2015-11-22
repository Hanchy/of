#!/bin/bash
cd "`dirname "$(readlink -f $0)"`"
cd ..
OF="`pwd`"

R=$1

function apply() {
  echo
  echo "$1"
  patch -Np1 $R < "$OF/dev/patches/$1"
}

#-------------------------------------------------------------------------------

cd "$OF/src/freeimage"

apply freeimage.patch
apply freeimage_plugin.patch

cd "$OF/src/glfw"

apply glfw_cmake.patch

cd "$OF/src/libtess2"

apply tess2.patch

cd "$OF/src/poco"

apply poco.patch
apply poco_cmake.patch

cd "$OF/src/videoinput"

apply videoinput.patch

cd "$OF/src/openframeworks"

apply openframeworks.patch
apply openframeworks_osx.patch
apply openframeworks_gles.patch
apply openframeworks_modules.patch
apply openframeworks_clang_windows.patch
apply openframeworks_cairo_render_feature.patch

cd "$OF/src/rtaudio"

apply rtaudio.patch

cd "$OF/addons"

apply addons.patch

