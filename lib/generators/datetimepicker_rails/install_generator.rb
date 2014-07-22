require 'securerandom'

module DatetimepickerRails
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      def source_path
        File.expand_path(File.dirname(__FILE__))
      end

      desc "Creates the Simple form custom fields definition for date, datetime and time pickers."

      def copy_datetime_picker
        template "inputs/datetime_picker_input.rb", "app/inputs/datetime_picker_input.rb" unless
            File.exist?('app/inputs/datetime_picker_input.rb')
      end

      def copy_date_picker
        template "inputs/date_picker_input.rb", "app/inputs/date_picker_input.rb" unless
            File.exist?('app/inputs/date_picker_input.rb')
      end

      def copy_time_picker
        template "inputs/time_picker_input.rb", "app/inputs/time_picker_input.rb" unless
            File.exist?('app/inputs/time_picker_input.rb')
      end

      def copy_pickers_js
        copy_file("#{source_paths.last}/js/pickers.js",
                  "vendor/assets/javascripts/pickers.js")
      end

      # Source the submodule with git://github.com/eonasdan/bootstrap-datetimepicker.git
      def copy_bootstrap_datetimepicker

        # update the submodule to the latest source version
        # git submodule: 'init'
        # git submodule: 'update'

        repo_root = File.join(File.expand_path("../../..", File.dirname(__FILE__)),
                              "bootstrap-datetimepicker")

        copy_file("#{repo_root}/build/css/bootstrap-datetimepicker.min.css",
                  "vendor/assets/stylesheets/bootstrap-datetimepicker.min.css")

        copy_file("#{repo_root}/build/css/bootstrap-datetimepicker.css",
                  "vendor/assets/stylesheets/bootstrap-datetimepicker.css")

        app_root = File.expand_path(File.dirname("."))
        inside("#{repo_root}/src/js") do
          file_paths = Dir["**/**/*"].select { |f| File.file?(f) }

          file_paths.each do |file_path|
            copy_file("#{repo_root}/src/js/#{file_path}", "#{app_root}/vendor/assets/javascripts/#{file_path}")
          end
        end

      end

      # We need to hack the bootstrap-datetimepicker.js by the time
      # the bugfix pull request will be accepted by Eonasdan
      def hacking_dataToOptions_bug
        gsub_file 'vendor/assets/javascripts/bootstrap-datetimepicker.js',
                  /else\s+\{\s+eData\s=\spicker\.element\.data\(\);\s/,
        <<-FILE
            else {
              eData = picker.element.find('input').data();
        FILE
      end

    end
  end
end