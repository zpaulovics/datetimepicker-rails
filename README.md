## SimpleForm & Bootstrap DateTimepicker for Rails

This gem packages the bootstrap-datetimepicker for Rails asset pipeline and creates the Simple Form custom fields for your project.

### Features

    - Prepares the vendor directory (javascripts, stylesheets)
    - Creates the custom fields for Simple Form
    - You can use 3 type of date & time pickers in your forms
    - You do not need to write any javascript or CSS code
    - The language automatically selected based on the locale
    - You can specify all the datetime-pickers options (weekStart, minDate, manDate, disabledDates, etc.)
    - The format of the date and time can be specified in the config/locales
    - You can customise the picker's iconset to use the Font-Awesome icons (dafault: Glyphicon)
    - Easy to install and use in your projects

### The current 4.3.5 version compatibility
 - Ruby 2.2.0
 - Rails 4.2
 - Simpleform 3.1
 - Momentjs-rails 2.9
 - http://eonasdan.github.io/bootstrap-datetimepicker version 4.3.5


### Branches

Master & eonasdan branches, tags v4.3.5+: Bootstrap 3+, Rails 4+ and SimpleForm 3.1+ (using https://github.com/eonasdan/bootstrap-datetimepicker.git as submodule, well maintained repo). Any further development will be made on these branches.

Tag v1.0.0: Rails 3.2, Bootstrap 2.3.2 & SimpleForm >= 2.0.4 - It is archived. No further development or maintenance.


### Dependency

Versions v4.3.5+ has a dependency on the moment.js version 2.9+ javascript library (for details refer to: http://momentjs.com/). Includes the dependency reference in yours Gemfile:
``` bash
gem 'momentjs-rails', '~> 2.9',  github: 'derekprior/momentjs-rails'
```

### Credits and references

The project is based on: https://github.com/tarruda/bootstrap-datetimepicker.git project. It was upgraded to be compatible with Bootstrap 3+ and was refactored significantly by Eonasdan (see: https://github.com/eonasdan/bootstrap-datetimepicker.git).

The project home page: https://github.com/zpaulovics/datetimepicker-rails.git


### Installation

According your needs, add one of the lines below to your application's Gemfile:

**Option 1:** Master & eonasdan branches, tags v4+: Bootstrap 3+, Rails 4+ and SimpleForm 3.1+ (using https://github.com/eonasdan/bootstrap-datetimepicker.git as submodule, well maintained repo). Any further development will be made on these branches:

``` bash
gem 'datetimepicker-rails', github: 'zpaulovics/datetimepicker-rails', branch: 'master', submodules: true
```


**Option 2:** Tag v1.0.0: Rails 3.2, Bootstrap 2.3.2 & SimpleForm >= 2.0.4 - *No further development or maintenance*.

    gem 'datetimepicker-rails', git: 'git://github.com/zpaulovics/datetimepicker-rails', tag: 'v1.0.0'

then execute:

    $ bundle install


### Configuration

Add this line to app/assets/stylesheets/application.css

``` css
 *= require bootstrap-datetimepicker
or
 *= require bootstrap-datetimepicker.min

```

Add the following lines to app/assets/javascripts/application.js

For version 4+:

```javascript
//= require moment
//= require bootstrap-datetimepicker
//= require pickers

// You may include any languages (optional)
//= require moment/<your locale>
```

For version v1.0.0:

```javascript
//= require bootstrap-datetimepicker/core
//= require bootstrap-datetimepicker/pickers

// You may include any languages (optional)
//= require bootstrap-datetimepicker/locales/bootstrap-datetimepicker.hu
```


### Calling the generator

After you install 'datetimepicker' and add it to your Gemfile, you need to run the generator.
The generator will create the custom field definitions for Simple Form in your project. There are 3
custom field definitions. The generator looks at the app/inputs directory of your project and creates
only those custom field definitions that are not already exists in your project. If you have a custom
input with the same name the generator does not overwrite it.

At generation time the pickers.js and required asset files will be places in your assets pipeline,
that makes these files accessible for you out of the box.

The datetimepicker-rails is using the following custom field definitions:

    datetime_picker_input.rb    # for fields with :as => :datetime_picker
    date_picker_input.rb        # for fields with :as => :date_picker
    time_picker_input.rb        # for fields with :as => :time_picker


To run the generator use the following command:
```
   $ rails generate datetimepicker_rails:install
```
if you want to use the default Glyphicon icons for the pickers.

To use the Font-Awesome icons for the pickers, execute the following command (only for version v4.0.0+)
```
  $ rails generate datetimepicker_rails:install Font-Awesome
```

The current version will copy the required files to your projects 'vendor/assets' directory (not to the gem's vendor/assets directory as before). That gives you much more flexibility to use your preferred options of the bootstrap-datetimepicker plugin.

To tailor the picker to your specific needs you can modify the SimpleForm 'input' definition files and/or the 'pickers.js' file at your own project area.

### Using datetimepicker-rails

Just call datetimepicker() with any selector.

#### HTML

```html
<input class="datetimepicker" type="text" >

<script type="text/javascript">
    $('.datetimepicker').datetimepicker();
</script>
```

#### Simple_Form

```html
<%= f.input :start_date_time, :as => :datetime_picker %>

<%= f.input :closing_date, :as => :date_picker %>

<%= f.input :begin_at, :as => :time_picker %>

<div class='row datetimerange'>
    <%= f.input :publish_date, as: :datetime_picker, wrapper: :ranged_datetime %>
    <%= f.input :expiration_date, as: :datetime_picker, wrapper: :ranged_datetime %>
</div>
```

The scripts below will be included when you use the "require pickers" (for version v4.0.0+) or "require bootstrap-datetimepicker/pickers" (for version v1.0.0). If you need different activation scripts, ignore the //= require pickers (for version v4.0.0+) or //= require bootstrap-datetimepicker/pickers (for version v1.0.0) line in app/assets/javascripts/application.js.

Version 4.3.5+:

```javascript
var default_picker_options = {
  // put here your default options that should be applied for all pickers

  // icons will be inserted if you run the generator with Font-Awesome parameter
  icons: {
    date: 'fa fa-calendar',
    time: 'fa fa-clock-o',
    up: 'fa fa-chevron-up',
    down: 'fa fa-chevron-down',
    previous: 'fa fa-chevron-left',
    next: 'fa fa-chevron-right',
    today: 'fa fa-crosshairs',
    clear: 'fa fa-trash-o'
  }
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

```

The default values of the options:

```
        format: false,
        dayViewHeaderFormat: 'MMMM YYYY',
        extraFormats: false,
        stepping: 1,
        minDate: false,
        maxDate: false,
        useCurrent: true,
        collapse: true,
        locale: moment.locale(),
        defaultDate: false,
        disabledDates: false,
        enabledDates: false,
        icons: {
            time: 'glyphicon glyphicon-time',
            date: 'glyphicon glyphicon-calendar',
            up: 'glyphicon glyphicon-chevron-up',
            down: 'glyphicon glyphicon-chevron-down',
            previous: 'glyphicon glyphicon-chevron-left',
            next: 'glyphicon glyphicon-chevron-right',
            today: 'glyphicon glyphicon-screenshot',
            clear: 'glyphicon glyphicon-trash'
        },
        useStrict: false,
        sideBySide: false,
        daysOfWeekDisabled: [],
        calendarWeeks: false,
        viewMode: 'days',
        toolbarPlacement: 'default',
        showTodayButton: false,
        showClear: false,
        widgetPositioning: {
            horizontal: 'auto',
            vertical: 'auto'
        },
        disallowReadOnly: true,
        keepOpen: false,
        inline: false
```
For more details, please refer to Bootstrap 3 Datepicker v4 Docs site:
  - [for public API documentation](http://eonasdan.github.io/bootstrap-datetimepicker/#bootstrap-3-datepicker-v4-docs)
  - [for description of the options](http://eonasdan.github.io/bootstrap-datetimepicker/Options/)

Version v1.0.0:

```javascript
    $(document).on('ready page:change', function() {
        $('.datepicker').datetimepicker({
            pickTime: false
        });
    });

    $(document).on('ready page:change', function() {
        $('.datetimepicker').datetimepicker({
            pickSeconds: false
        });
    });

    $(document).on('ready page:change', function() {
        $('.timepicker').datetimepicker({
            pickDate: false,
            pickSeconds: false
        });
    });
```

### Date and time formating

Specify your intended date and time formats in your config/locales/en.yml or related language file as follows:

    en:
      datepicker:
        dformat: '%d/%m/%Y'             # display format of the date (this is the default, can be ommited)
        pformat: 'DD/MM/YYYY'           # picking format of the date (this is the default, can be ommited)
      timepicker:
        dformat: '%R'                   # display format of the time (this is the default, can be ommited)
        pformat: 'HH:mm'                # picking format of the time (this is the default, can be ommited)
      dayViewHeaderFormat: 'MMMM YYYY'  # picking format of the time (this is the default, can be ommited)

#### Notes for formating date/time:

* dformat is used to format any date value to put it to the html input tag value attribute.
The standard Ruby Time library 'strftime' method is used to make this date to string conversion.
For more details, please refer to the Ruby Built-in Classes and Modules documentation.
This should be applied for any version.

* pformat is the format, that used by the JavaScript library to format the date/time string submitted by a form.

1. pformat for current versions: We have upgraded to the repository of bootstrap-datetimepicker by Eonasdan as submodule, the new library is using the moment.js (for more information see Moment's documentation [here](http://momentjs.com/docs/#/displaying/format/).

2. pformat for version v1.0.0: Version v1.0.0 are based on the bootstrap-datetimepicker by @tarruda, which applies a different pattern to make the date to string conversion. He does not release any documentation. Here is the related part of the source code:
```
    dd: {property: 'UTCDate', getPattern: function() { return '(0?[1-9]|[1-2][0-9]|3[0-1])\\b';}},
    MM: {property: 'UTCMonth', getPattern: function() {return '(0?[1-9]|1[0-2])\\b';}},
    yy: {property: 'UTCYear', getPattern: function() {return '(\\d{2})\\b'}},
    yyyy: {property: 'UTCFullYear', getPattern: function() {return '(\\d{4})\\b';}},
    hh: {property: 'UTCHours', getPattern: function() {return '(0?[0-9]|1[0-9]|2[0-3])\\b';}},
    mm: {property: 'UTCMinutes', getPattern: function() {return '(0?[0-9]|[1-5][0-9])\\b';}},
    ss: {property: 'UTCSeconds', getPattern: function() {return '(0?[0-9]|[1-5][0-9])\\b';}},
    ms: {property: 'UTCMilliseconds', getPattern: function() {return '([0-9]{1,3})\\b';}},
    HH: {property: 'Hours12', getPattern: function() {return '(0?[1-9]|1[0-2])\\b';}},
    PP: {property: 'Period12', getPattern: function() {return '(AM|PM|am|pm|Am|aM|Pm|pM)\\b';}}
```

### For more details of usage

[You can find a demo application using the datetimeoicker-rails gem here] (https://github.com/zpaulovics/dateTimeDemo)


See the documentation & excellent demos provided by plugin's authors:

1. for current version: by [@Eonasdan](https://github.com/Eonasdan) the documentation is [here](http://eonasdan.github.io/bootstrap-datetimepicker/),

2. for version v1.0.0: by [@tarruda](https://github.com/tarruda) the documentation is [here](http://tarruda.github.com/bootstrap-datetimepicker/).


### Contributing

1. Fork it.
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
