require 'net/http'
require 'json'

response = Net::HTTP.get(URI('https://api.github.com/repos/NESTlab/argos3-webviz/releases/latest'))
json_data = JSON.parse(response)

indx1 = response.rindex('OSX.pkg') + 7
indx2 = response[0, indx1].rindex('"') + 1

url = response[indx2, indx1 - indx2].strip # Get OSX url link
pkg_name = url[(url.rindex('/') + 1)..-1]

cask 'argos3-webviz' do
  version json_data['tag_name']
  sha256 :no_check

  url url
  appcast 'https://github.com/NESTlab/argos3-webviz/releases.atom'
  name 'argos3-webviz'
  homepage 'https://github.com/NESTlab/argos3-webviz'

  depends_on macos: '>= :sierra'
  depends_on arch: :x86_64
  depends_on formula: 'ilpincy/argos3/argos3'
  depends_on formula: 'openssl@1.1'

  pkg pkg_name

  uninstall pkgutil: 'com.argos3.plugins.webviz'
end
