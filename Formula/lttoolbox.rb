class Lttoolbox < Formula
    desc "Finite state compiler, processor and helper tools used by apertium"
    homepage "https://wiki.apertium.org/wiki/Lttoolbox"
    url "https://apertium.projectjj.com/apt/nightly/source/lttoolbox/lttoolbox_3.8.0+g641~648471e4.orig.tar.bz2"
    version "3.8.0+g641.648471e4"
    sha256 "eb51967ef641fce976ed8db7e70361354b8d909c34fab91d3f9c6c7a89b75719"
    license "GPL-2.0-or-later"
  
    head "https://github.com/apertium/lttoolbox.git", branch: "main"

    bottle do
        root_url "https://github.com/Fane1824/homebrew-tap-nightly/releases/download/lttoolbox"
        sha256 cellar: :any, arm64_sequoia: "7b99f4a8f82f1581ce3f79b40df14080632317e92dbdaebe0a08f5f27fbab9e6"
        sha256 cellar: :any_skip_relocation, x86_64_linux: "006977635b226aa71347ab994fecd50025afc3e66bb4627741006629e6e2cccb"
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