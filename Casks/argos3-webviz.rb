cask 'argos3-webviz' do
  version '0.4.70'
  sha256 'b0a94db35294ca26d651f344b45a09de4d4a9853ccdbcc193f394456d9f9e2e3'

  url 'https://github.com/NESTLab/argos3-webviz/releases/download/0.4.70/argos3plugin_simulator_webviz-0.4.70-x86_64-OSX.pkg'
  appcast 'https://github.com/NESTlab/argos3-webviz/releases.atom'
  name 'argos3-webviz'
  homepage 'https://github.com/NESTlab/argos3-webviz'

  depends_on macos: '>= :sierra'
  depends_on arch: :x86_64
  depends_on formula: 'ilpincy/argos3/argos3'
  depends_on formula: 'openssl@1.1'

  pkg 'argos3plugin_simulator_webviz-0.4.70-x86_64-OSX.pkg'

  uninstall pkgutil: 'com.argos3.plugins.webviz'
end
