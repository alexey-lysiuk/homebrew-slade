require "formula"

class Slade < Formula
  desc "SLADE is a modern editor for Doom-engine based games and source ports"
  homepage "http://slade.mancubus.net/"
  url "https://github.com/sirjuddington/SLADE/archive/3.1.0.4.tar.gz"
  sha256 "f643174975b2e7cd5c54be75a319a128f703231115f2ceba34ef0b9718d5fb8e"
  head "https://github.com/sirjuddington/SLADE.git"

  # SFML newer than 2.1 requires OS X 10.7
  # This is fine, because brew only supports the last 2 macOS versions, and we're on 10.15 atm

  depends_on "cmake"
  depends_on "fluid-synth"
  depends_on "freeimage"
  depends_on "ftgl"
  depends_on "sfml"
  depends_on "GLEW"

  #
  # NOTE: Cannot use default wxWidgets formula at the moment
  #       because of disabled mediactrl library for 64-bit target
  #

  # depends_on "wxmac"
  depends_on "wxwidgets-slade"

  def install
    system "cmake", "-DGLEW_INCLUDE_PATH=/usr/local/Cellar/glew/2.1.0/include", "-DGLEW_LIBRARY=/usr/local/Cellar/glew/2.1.0/lib/libGLEW.2.1.dylib", ".", *std_cmake_args
    system "make"
    prefix.install "SLADE.app"
  end

  def caveats
    "SLADE.app installed to #{prefix}"
  end
end
