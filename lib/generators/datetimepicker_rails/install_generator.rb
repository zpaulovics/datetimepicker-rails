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
          down: "fa fa-chevron-down",
          previous: 'fa fa-chevron-left',
          next: 'fa fa-chevron-right',
          today: 'fa fa-crosshairs',
          clear: 'fa fa-trash-o'
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

      def copy_datetime_wrapper
        template "wrappers/ranged_datetime_wrapper.rb", "config/initializers/ranged_datetime_wrapper.rb" unless
            File.exist?('config/initializers/ranged_datetime_wrapper.rb')
      end

      def create_pickers_js
        puts("icon_family: #{icon_family}")
        icons = icon_family == 'Glyphicon' ? '' : get_icons

        vendor 'assets/javascripts/pickers.js' do <<-FILE
var default_picker_options = {
#{icons}
}

$(document).on('ready page:change', function() {
  $('.datetimepicker').datetimepicker(default_picker_options);

  $('.timepicker').datetimepicker(default_picker_options);

  $('.datepicker').datetimepicker(default_picker_options);

  $('.datetimerange').each(function(){
    var $this = $(this)
    var range1 = $($this.find('.input-group')[0])
    var range2 = $($this.find('.input-group')[1])

    if(range1.data("DateTimePicker").date() != null)
      range2.data("DateTimePicker").minDate(range1.data("DateTimePicker").date());

    if(range2.data("DateTimePicker").date() != null)
      range1.data("DateTimePicker").maxDate(range2.data("DateTimePicker").date());

    range1.on("dp.change",function (e) {
      if(e.date)
        range2.data("DateTimePicker").minDate(e.date);
      else
        range2.data("DateTimePicker").minDate(false);
    });

    range2.on("dp.change",function (e) {
      if(e.date)
        range1.data("DateTimePicker").maxDate(e.date);
      else
        range1.data("DateTimePicker").maxDate(false);
    });
  })
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
        icons = "    icons: {\n"
        icons += "      date: \'#{options[:custom_icons][:date]}\',\n"
        icons += "      time: \'#{options[:custom_icons][:time]}\',\n"
        icons += "      up: \'#{options[:custom_icons][:up]}\',\n"
        icons += "      down: \'#{options[:custom_icons][:down]}\',\n"
        icons += "      previous: \'#{options[:custom_icons][:previous]}\',\n"
        icons += "      next: \'#{options[:custom_icons][:next]}\',\n"
        icons += "      today: \'#{options[:custom_icons][:today]}\',\n"
        icons += "      clear: \'#{options[:custom_icons][:clear]}\'\n"
        icons += "    }\n"
      end

    end
  end
end