#!/usr/bin/env rake
require "bundler/gem_tasks"

desc "Clean the vendor directory"
task :clean do
  FileUtils.rm_rf 'vendor'
end

desc "Update assets in vendor directory"
task :update_assets do
  system('git submodule update') unless File.exist?('bootstrap-datetimepicker/README.md')

  Rake.rake_output_message 'Generating javascripts'
  FileUtils.mkdir_p "vendor/assets/javascripts"
  FileUtils.cp_r Dir["bootstrap-datetimepicker/src/js/bootstrap-datetimepicker.js"], "vendor/assets/javascripts/bootstrap-datetimepicker/core.js"
  FileUtils.cp_r Dir["bootstrap-datetimepicker/src/js/locales/*"], "vendor/assets/javascripts/bootstrap-datetimepicker/locales/"

  Rake.rake_output_message 'Generating stylesheets'
  FileUtils.mkdir_p "vendor/assets/stylesheets"
  FileUtils.cp_r Dir["bootstrap-datetimepicker/build/css/*"], "vendor/assets/stylesheets"
  Dir["vendor/assets/stylesheets/*"].each do |file|
    FileUtils.mv(file, file.gsub("min.css", "css"))
  end
end

desc "Update custom field definition in app/input directory"
task :update_fields do

end

desc "Clean and update"
task default: [:clean, :update_assets, :update_fields]

task build: :default

