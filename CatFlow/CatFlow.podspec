

Pod::Spec.new do |spec|

  spec.name         = "CatFlow"
  spec.version      = "1.0.0"
  spec.summary      = "A short description of CatFlow."
  spec.homepage     = "https://www.jianshu.com/p/6f38975f07b6"
  spec.license      = "MIT"
  spec.author       = "wangyongyue"
  spec.platform     = :ios, "8.0"
  spec.ios.deployment_target = "8.0"
  spec.swift_version = '4.2'
  spec.source       = { :git => "https://github.com/wangyongyue/CatFlow.git", :tag => "#{spec.version}" }
  spec.source_files = "CatFlow/Cat/**/*.swift"
  spec.requires_arc = true
  
end
