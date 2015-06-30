#
# Be sure to run `pod lib lint BDLibrary.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = "BDLibrary"
s.version          = "0.1.0"
s.summary          = "百度大数据的静态库"
s.description      = <<-DESC
百度大数据的静态库百度大数据的静态库百度大数据的静态库百度大数据的静态库百度大数据的静态库百度大数据的静态库百度大数据的静态库百度大数据的静态库
DESC
s.homepage         = "https://github.com/zhuayi/BDLibrary"

s.license          = 'MIT'
s.author           = { "zhuayi" => "2179942@qq.com" }
s.source           = { :git => "https://github.com/zhuayi/BDLibrary.git", :tag => s.version.to_s }

s.platform     = :ios, '7.0'
s.requires_arc = true

#s.source_files = 'Pod/Classes/**/*'
#  s.resource_bundles = {
#    'BDLibrary' => ['Pod/Assets/*.png']
#  }

s.prefix_header_contents = '#import <UIKit/UIKit.h>'



#################################### Base ######################################################

    s.subspec 'Base' do | base |
        base.source_files = 'Pod/Classes/**/*', 'Pod/OpenSource/CrabCrashReportSDK/**/*.h', 'Pod/OpenSource/Mtj/BaiduMobStat.h'
        base.public_header_files = 'Pod/Classes/**/*.h'
        base.libraries  = 'z.1.2.5', 'stdc++'
        base.vendored_frameworks = 'Pod/OpenSource/CrabCrashReportSDK/CrashReporter.framework'
        base.vendored_libraries = 'Pod/OpenSource/CrabCrashReportSDK/libCrabCrashReport.a','Pod/OpenSource/Mtj/libBaiduMobStat.a'
        base.frameworks = 'CoreLocation', 'CoreTelephony'
    end

############################################################################################################


#################################### ZEasing ######################################################

    s.subspec 'ZEasing' do | zEasing |
        zEasing.source_files = 'Pod/OpenSource/ZEasing/Pod/Classes/**/*'
        zEasing.public_header_files = 'Pod/OpenSource/ZEasing/Pod/Classes/**/*.h'
    end

############################################################################################################


#################################### test ###############################################################
#
#s.subspec 'test' do | test |
#test.source_files = 'Pod/OpenSource/test/test/Class/**/*'
#test.public_header_files = 'Pod/OpenSource/test/test/Class/**/*.h'
#end
#
##########################################################################################################



s.frameworks = 'UIKit'
s.libraries  = 'z.1.2.5'
s.dependency 'AFNetworking', '~> 2.3'


end
