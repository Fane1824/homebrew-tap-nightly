class Lttoolbox < Formula
    desc "Finite state compiler, processor and helper tools used by apertium"
    homepage "https://wiki.apertium.org/wiki/Lttoolbox"
    version "3.8.0+g641.648471e4"
    
    stable do
      url "https://apertium.projectjj.com/apt/nightly/source/lttoolbox/lttoolbox_3.8.0+g641~648471e4.orig.tar.bz2"
      sha256 "eb51967ef641fce976ed8db7e70361354b8d909c34fab91d3f9c6c7a89b75719"
    end
  
    head "https://github.com/apertium/lttoolbox.git", branch: "main"
  
    depends_on "cmake" => :build
    depends_on "icu4c"
    depends_on "libxml2"
    depends_on "python3"
    depends_on "utfcpp"  # ✅ Ensure utfcpp is included
  
    def install
      # ✅ Explicitly tell CMake where to find utf8.h
      ENV.append "CXXFLAGS", "-I#{Formula["utfcpp"].opt_include}"
      ENV.append "LDFLAGS", "-L#{Formula["utfcpp"].opt_lib}"
  
      mkdir "build" do
        system "cmake", "..", *std_cmake_args
        system "make"
        system "ctest"
        system "make", "install"
      end
    end
  
    test do
      system "true"
    end
  end
  