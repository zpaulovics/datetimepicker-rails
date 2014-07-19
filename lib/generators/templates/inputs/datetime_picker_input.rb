class DatetimePickerInput < SimpleForm::Inputs::StringInput
  def input(wrapper_options)
    value = object.send(attribute_name) if object.respond_to? attribute_name
    display_pattern = I18n.t('datepicker.dformat', :default => '%d/%m/%Y') + ' ' + I18n.t('timepicker.dformat', :default => '%R')
    input_html_options[:value] ||= I18n.localize(value, :format => display_pattern) if value.present?

    input_html_options[:type] = 'text'
    picker_pettern = I18n.t('datepicker.pformat', :default => 'dd/MM/yyyy') + ' ' + I18n.t('timepicker.pformat', :default => 'hh:mm')
    input_html_options[:data] ||= {}
    input_html_options[:data].merge!({ format: picker_pettern, language: I18n.locale.to_s,
                                       date_weekstart: I18n.t('datepicker.weekstart', :default => 0) })

    template.content_tag :div, class: 'input-group date datetimepicker' do
      input = super(wrapper_options) # leave StringInput do the real rendering
      input += template.content_tag :span, class: 'input-group-addon' do
        template.content_tag :i, '', class: 'glyphicon glyphicon-calendar',
                             data: { 'time-icon' => 'glyphicon glyphicon-time',
                                     'date-icon' => 'glyphicon glyphicon-calendar' }
      end
      input
    end
  end

  def input_html_classes
    super.push ''   # 'form-control'
  end
end

