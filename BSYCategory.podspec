Pod::Spec.new do |s|
  s.name         = "BSYCategory" 
  s.version      = "1.1.0"     
  s.license      = "MIT"       
  s.summary      = "BSYCategory is Tool"

  s.homepage     = "https://github.com/baishiyun/BSYCategory" # 你的主页
  s.source       = { :git => "https://github.com/baishiyun/BSYCategory.git", :tag => "#{s.version}" }
  s.source_files = "BSYCateg
ory/*.{h,m}"
  s.requires_arc = true 
  s.platform     = :ios, "7.0" 
  s.frameworks   = "UIKit", "Foundation"
  s.author             = { "白仕云" => "baishiyun@163.com" } 
  s.social_media_url   = "https://github.com/baishiyun" 

end
