require "formula"

class Slade < Formula
  desc "SLADE It's a Doom editor"
  homepage "http://slade.mancubus.net/"
  head "https://github.com/sirjuddington/SLADE.git"

  depends_on "cmake"
  depends_on "fluid-synth"
  depends_on "freeimage"
  depends_on "ftgl"
  depends_on "sfml"
  
  #
  # NOTE: Cannot use default wxWidgets formula at the moment
  #       because of disabled mediactrl library for 64-bit target
  #

  # depends_on "wxmac"
  depends_on "wxwidgets-slade"

  def install
    system "cmake", ".", *std_cmake_args
    system "make"
  end
end
