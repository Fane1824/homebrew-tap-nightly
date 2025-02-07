class Lttoolbox < Formula
    desc "Finite state compiler, processor and helper tools used by apertium"
    homepage "https://wiki.apertium.org/wiki/Lttoolbox"
    url "https://apertium.projectjj.com/apt/nightly/source/lttoolbox/lttoolbox_3.8.0+g641~648471e4.orig.tar.bz2"
    version "3.8.0+g641.648471e4"
    sha256 "eb51967ef641fce976ed8db7e70361354b8d909c34fab91d3f9c6c7a89b75719"
    license "GPL-2.0-or-later"
  
    head "https://github.com/apertium/lttoolbox.git", branch: "main"

    bottle do
        root_url "https://github.com/Fane1824/homebrew-tap-nightly/releases/download/lttoolbox-3.8.0+g641-648471e4"
        sha256 cellar: :any, arm64_sequoia: "64e242fc034396fd98fd2d48374a89b57e3dc04f8f70bba20c4c30e5a2077c92"
        sha256 cellar: :any_skip_relocation, x86_64_linux: "d1366abbcf25cbf56f478e4574ad90d669e6dd15255360699f7a554cdb573419"
    end      
    
    depends_on "cmake" => :build
    depends_on "pkg-config" => :build
    depends_on "swig" => :build
    depends_on "python-setuptools" => :build
    depends_on "utf8cpp" => :build
  
    depends_on "icu4c"
    depends_on "libxml2"
    depends_on "python3"
  
    def install
      system "cmake", "-S", ".", "-B", "build", "-DBUILD_SHARED_LIBS=ON", *std_cmake_args
      system "cmake", "--build", "build"
      system "ctest", "--test-dir", "build", "--output-on-failure"
      system "cmake", "--build", "build", "--target", "install"
    end
  
    test do
      system "true"
    end
  end