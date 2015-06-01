require "formula"

class Slade < Formula
  homepage "http://slade.mancubus.net/"
  head "https://github.com/sirjuddington/SLADE.git"

  depends_on "cmake"
  depends_on "fluid-synth"
  depends_on "freeimage"
  depends_on "ftgl"
  depends_on "sfml"
  depends_on "wxmac"

  def install
    system "cmake", ".", *std_cmake_args
    system "make"
  end
end
