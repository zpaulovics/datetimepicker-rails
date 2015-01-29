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
  FileUtils.mkdir_p "vendor/assets/javascripts/bootstrap-datetimepicker/locales"
  FileUtils.cp_r Dir["bootstrap-datetimepicker/src/js/*"], "vendor/assets/javascripts/bootstrap-datetimepicker"
  FileUtils.mv "vendor/assets/javascripts/bootstrap-datetimepicker/bootstrap-datetimepicker.js",
               "vendor/assets/javascripts/bootstrap-datetimepicker/core.js"
  FileUtils.cp_r Dir["lib/generators/templates/js/*"], "vendor/assets/javascripts/bootstrap-datetimepicker"

  Rake.rake_output_message 'Generating stylesheets'
  FileUtils.mkdir_p "vendor/assets/stylesheets"
  FileUtils.cp_r Dir["bootstrap-datetimepicker/build/css/*"], "vendor/assets/stylesheets"
  Dir["vendor/assets/stylesheets/*"].each do |file|
    FileUtils.mv(file, file.gsub("min.css", "css"))
  end
end

desc "Clean and update"
task default: [:clean, :update_assets]

task build: [:clean, :update_assets]

