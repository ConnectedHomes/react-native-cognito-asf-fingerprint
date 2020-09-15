require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-cognito-asf-fingerprint"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.description  = <<-DESC
                  react-native-cognito-asf-fingerprint
                   DESC
  s.homepage     = "https://github.com/sandfox/react-native-cognito-asf-fingerprint"
  # brief license entry:
  s.license      = "MIT"
  # optional - use expanded license entry instead:
  # s.license    = { :type => "MIT", :file => "LICENSE" }
  s.authors      = { "James Butler" => "github@sandfox.co.uk" }
  s.platforms    = { :ios => "9.0" }
  s.source       = { :git => "https://github.com/sandfox/react-native-cognito-asf-fingerprint.git", :tag => "#{s.version}" }

  s.source_files = "ios/**/*.{h,c,m,swift}"
  s.requires_arc = true

  s.dependency "React"
  # ...
  # s.dependency "..."
end

