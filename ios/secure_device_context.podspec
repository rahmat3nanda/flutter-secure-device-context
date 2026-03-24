Pod::Spec.new do |s|
  s.name             = 'secure_device_context'
  s.version          = '1.0.0'
  s.summary          = 'A new Flutter project.'
  s.description      = <<-DESC
A new Flutter project.
                       DESC
  s.homepage         = 'https://github.com/rahmat3nanda'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Rahmat Trinanda' => 'rahmat3nanda@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'

  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
  s.dependency 'SecureDeviceContext', '1.0.0'
end
