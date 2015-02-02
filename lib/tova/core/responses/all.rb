response_directory = File.expand_path('../', __FILE__)
files = Dir["#{response_directory}/**/*"]

files.each {|file| require file }
