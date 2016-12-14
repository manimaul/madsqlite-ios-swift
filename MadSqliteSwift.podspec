#
# Be sure to run `pod lib lint MadSqlite.podspec' to ensure this is a
# valid spec before submitting. https://guides.cocoapods.org/making/getting-setup-with-trunk ->  'pod trunk push MadSqlite.podspec'
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name                   = 'MadSqliteSwift'
  s.version                = '0.2.1'

  s.summary                = 'A simple Sqlite Abstraction'
  s.description            = 'A simple Sqlite Abstraction with FTS5 and R*Tree enabled'
  s.homepage               = 'https://manimaul.github.io/madsqlite/'
  s.license                = { :type => 'BSD', :file => 'LICENSE.md' }
  s.author                 = { 'William Kamp' => 'manimaul@gmail.com' }
  s.documentation_url      = 'https://manimaul.github.io/madsqlite/ios'

  s.source                 = { :git => 'https://github.com/manimaul/madsqlite-ios-swift.git' :tag => s.version.to_s }

  s.ios.deployment_target  = '10.1'
  s.source_files           = 'MadSqliteSwift/**/*.{swift}'
  s.requires_arc           = true
  s.dependency 'MadSqlite', s.version.to_s 
end
