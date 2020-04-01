Pod::Spec.new do |s|

    s.name         = 'ELKParallel'
    
    s.version      = '1.0.0'
    
    s.summary      = '常用OC分类'
    s.description  = <<-DESC
                    常用OC分类集合
                    DESC

    s.homepage     = 'https://github.com/elkshrek/ELKParallel-master'

    s.license      = 'MIT'
    s.author       = { 'Jonathan' => 'Jonathan_dk@163.com' }
    
    s.source       = { :git => "https://github.com/elkshrek/ELKParallel-master.git", :tag => "#{s.version}" }
    s.requires_arc = true
    s.platform     = :ios, '9.0'
    
    s.public_header_files = 'ELKParallel/ELKParallel.h'
    s.source_files = 'ELKParallel/ELKParallel.h'
    
    s.subspec 'ELKCommon' do |cs|
        cs.source_files = 'ELKParallel/Common/**/*.{h,m}'
        cs.public_header_files = 'ELKParallel/Common/**/*.h'
    end
    
    s.subspec 'ELKTool' do |ts|
        ts.source_files = 'ELKParallel/Tool/**/*.{h,m}'
        ts.public_header_files = 'ELKParallel/Tool/**/*.h'
        
        ts.ios.frameworks = 'SystemConfiguration', 'Foundation'
        ts.libraries   = 'c++', 'z'
    end
    
    s.subspec 'ELKCategory' do |gs|
        gs.dependency 'ELKParallel/ELKCommon'
        gs.dependency 'ELKParallel/ELKTool'
        gs.dependency 'Masonry'
        
        gs.source_files = 'ELKParallel/Category/**/*.{h,m}'
        gs.public_header_files = 'ELKParallel/Category/**/*.h'
        
        gs.ios.frameworks = 'Foundation', 'UIKit', 'CoreTelephony', 'SystemConfiguration', 'NetworkExtension', 'AVFoundation'
        gs.libraries   = 'c++', 'z'
    end
    
    

end
