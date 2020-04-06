require 'net/http'
require 'json'
require 'formula'

response = Net::HTTP.get(URI('https://api.github.com/repos/NESTlab/argos3-webviz/releases/latest'))
$json_data = JSON.parse(response)

class Argos3Webviz < Formula
  desc "A Web interface plugin for ARGoS 3(https://argos-sim.info)."
  homepage "https://github.com/NESTlab/argos3-webviz"
  head "https://github.com/NESTlab/argos3-webviz.git"
  sha256 "5a900510eaf9b7fac04ed4c3fb37379d90da98a707f40ed34e46679d44d3beae"
  
  url $json_data["tarball_url"]
  version $json_data["tag_name"]

  depends_on "ilpincy/argos3/argos3" => [:build, :test]
  depends_on "openssl@1.1" => :build
  depends_on "pkg-config" => :build
  depends_on "cmake" => :build
  depends_on "lua"
  
  def install
    mkdir "build"
    cd "build" 
    system "cmake", "../src", "-DCMAKE_BUILD_TYPE=Release", "-DCMAKE_INSTALL_PREFIX=#{prefix}"
    system "cmake", "--build", ".", "--target", "all", "--parallel"
    system "make", "install"
  end

  test do
    system "argos3 -q webviz"
  end
end