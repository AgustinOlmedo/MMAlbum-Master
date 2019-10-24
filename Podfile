platform :ios, '13.1'
use_frameworks!

target 'MMAlbum' do
	pod 'Alamofire', '~> 4.0'
    	pod 'SwiftyJSON', '~> 4.0'
end

pre_install do |installer|
	def installer.verify_no_static_framework_transitive_dependencies; end
end

post_install do |installer|
	installer.pods_project.targets.each do |target|
		target.build_configurations.each do |config|
			config.build_settings['SWIFT_VERSION'] = '5'
		end
	end
end



