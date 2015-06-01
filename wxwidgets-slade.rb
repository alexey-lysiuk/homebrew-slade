#
# Based on Wxmac formula at
# https://github.com/Homebrew/homebrew/commit/fea99c61c7e1bd7dc3e5e7b3dd05cb18b84090c6
#
# Changes are:
#  * Mediactrl library is enabled
#  * Universal binary is disabled
#  * HEAD only
#  * Bottles are removed
#  

require "formula"

class WxwidgetsSlade < Formula
  homepage "https://www.wxwidgets.org"
  head "https://github.com/wxWidgets/wxWidgets.git"

  depends_on "jpeg"
  depends_on "libpng"
  depends_on "libtiff"

  option "with-stl", "use standard C++ classes for everything"
  option "with-static", "build static libraries"

  def install
    args = [
      "--disable-debug",
      "--prefix=#{prefix}",
      "--enable-unicode",
      "--enable-std_string",
      "--enable-display",
      "--with-opengl",
      "--with-osx_cocoa",
      "--with-libjpeg",
      "--with-libtiff",
      # Otherwise, even in superenv, the internal libtiff can pick
      # up on a nonuniversal xz and fail
      # https://github.com/Homebrew/homebrew/issues/22732
      "--without-liblzma",
      "--with-libpng",
      "--with-zlib",
      "--enable-dnd",
      "--enable-clipboard",
      "--enable-webkit",
      "--enable-svg",
      "--enable-mediactrl",
      "--enable-graphics_ctx",
      "--enable-controls",
      "--enable-dataviewctrl",
      "--with-expat",
      "--with-macosx-version-min=#{MacOS.version}",
      "--disable-precomp-headers",
      # This is the default option, but be explicit
      "--disable-monolithic"
    ]

    args << "--enable-stl" if build.with? "stl"

    if build.with? "static"
      args << "--disable-shared"
    else
      args << "--enable-shared"
    end

    system "./configure", *args
    system "make", "install"
  end

  test do
    system "wx-config", "--libs"
  end
end
