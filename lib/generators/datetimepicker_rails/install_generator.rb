require 'securerandom'

module DatetimepickerRails
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      argument :icon_family, type: :string, :default => "Glyphicon"

      class_option :custom_icons, type: :hash, :default => {
          date: "fa fa-calendar",
          time: "fa fa-clock-o",
          up:   "fa fa-chevron-up",
          down: "fa fa-chevron-down"
      }

      def source_path
        File.expand_path(File.dirname(__FILE__))
      end

      desc "Creates the Simple form custom fields definition for date, datetime and time pickers."

      def copy_datetime_picker
        template "inputs/datetime_picker_input.rb", "app/inputs/datetime_picker_input.rb" unless
            File.exist?('app/inputs/datetime_picker_input.rb')

        # massage the icons
        gsub_file('app/inputs/datetime_picker_input.rb', 'glyphicon glyphicon-calendar',
                  options[:custom_icons][:date]) unless icon_family == 'Glyphicon'
      end

      def copy_date_picker
        template "inputs/date_picker_input.rb", "app/inputs/date_picker_input.rb" unless
            File.exist?('app/inputs/date_picker_input.rb')

        # massage the icons
        gsub_file('app/inputs/date_picker_input.rb', 'glyphicon glyphicon-calendar',
                  options[:custom_icons][:date]) unless icon_family == 'Glyphicon'
      end

      def copy_time_picker
        template "inputs/time_picker_input.rb", "app/inputs/time_picker_input.rb" unless
            File.exist?('app/inputs/time_picker_input.rb')

        # massage the icons
        gsub_file('app/inputs/time_picker_input.rb', 'glyphicon glyphicon-time',
                  options[:custom_icons][:time]) unless icon_family == 'Glyphicon'
      end

      # def copy_pickers_js
      #   copy_file("#{source_paths.last}/js/pickers.js",
      #             "vendor/assets/javascripts/pickers.js")
      # end

      def create_pickers_js
        puts("icon_family: #{icon_family}")
        icons = icon_family == 'Glyphicon' ? '' : get_icons

        vendor 'assets/javascripts/pickers.js' do <<-FILE
$(document).on('ready page:change', function() {
  $('.datepicker').datetimepicker({
#{icons}      direction: 'bottom',
      pickTime: false
  });
});

$(document).on('ready page:change', function() {
  $('.datetimepicker').datetimepicker({
#{icons}      direction: 'bottom',
pickSeconds: false
  });
});

$(document).on('ready page:change', function() {
  $('.timepicker').datetimepicker({
#{icons}      direction: 'bottom',
      pickDate: false,
      pickSeconds: false
  });
});
        FILE
        end
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

    private

      def get_icons
        icons = "       icons: {\n"
        icons += "          date: \'#{options[:custom_icons][:date]}\',\n"
        icons += "          time: \'#{options[:custom_icons][:time]}\',\n"
        icons += "          up: \'#{options[:custom_icons][:up]}\',\n"
        icons += "          down: \'#{options[:custom_icons][:down]}\'\n"
        icons += "      },\n"
      end

    end
  end
end