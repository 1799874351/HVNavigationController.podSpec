Pod::Spec.new do |s|
  s.name         = "HVNavigationController"
  s.version      = "0.0.1"
  s.summary      = "跳转到navigation栈中指定controller，移除栈中自定义区间的controller"


  s.description  = "通过指定class 或则controller实例 跳转到navigation栈中指定controller，移除栈中自定义区间的controller"

  s.homepage     = "https://github.com/1799874351/HVNavigationController"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See http://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  s.license      = "MIT (example)"
  s.license      = { :type => "MIT",:file => "LICENSE" }


  s.author             = { "hevim" => "hevim0315@gmail.com" }
  # Or just: s.author    = "luohefei"
  # s.authors            = { "luohefei" => "luohefei@baidu.com" }
  # s.social_media_url   = "http://twitter.com/luohefei"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  # s.platform     = :ios
  s.platform     = :ios, "5.0"

  #  When using multiple platforms
  # s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  s.source       = { :git => "https://github.com/1799874351/HVNavigationController.git", :tag => "#{s.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  s.source_files  = "Classes/**/*.{h,m}"

  s.public_header_files = "Classes/**/*.h"


end
