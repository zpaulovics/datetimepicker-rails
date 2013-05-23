#class XdatetimePickerInput < SimpleForm::Inputs::StringInput
#  def input
#    value = object.send(attribute_name) if object.respond_to? attribute_name
#    input_html_options[:value] ||= I18n.localize(value, :format => '%Y/%m/%d %R') if value.present?
#    input_html_classes << "datetimepicker"
#
#    input_html_options[:type] = 'text'
#    input_html_options[:data] ||= {}
#    input_html_options[:data].merge!({ format: 'yyyy/mm/dd HH:MM' })
#
#    template.content_tag :div, class: 'input-append date' do
#      input = super # leave StringInput do the real rendering
#      input += template.content_tag :span, class: 'add-on' do
#        template.content_tag :i, '', class: 'icon-calendar', data: { 'time-icon' => 'icon-time', 'date-icon' => 'icon-calendar' }
#      end
#      input
#    end
#  end
#end

class TimePickerInput < SimpleForm::Inputs::StringInput
  def input
    value = object.send(attribute_name) if object.respond_to? attribute_name
    input_html_options[:value] ||= I18n.localize(value, :format => '%R') if value.present?
    input_html_classes << "timepicker"

    super # leave StringInput do the real rendering
  end
end
