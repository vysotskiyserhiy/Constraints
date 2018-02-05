Pod::Spec.new do |s|
  s.name             = 'Constraints'
  s.version          = '1.2.0'
  s.summary          = 'Easy Swift programmatic constraints'
  s.homepage         = 'https://github.com/vysotskiyserhiy/Constraints'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Serhiy Vysotskiy' => 'vysotskiyserhiy@gmail.com' }
  s.source           = { :git => 'https://github.com/vysotskiyserhiy/Constraints.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = 'Constraints/Classes/**/*'
  s.frameworks = 'UIKit'
end
