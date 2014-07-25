## SimpleForm & Bootstrap DateTimepicker for Rails

This gem packages the bootstrap-datetimepicker for Rails asset pipeline, and creates the Simple Form custom fields for your project.


### Features

    - Prepares the vendor directory (javascripts, stylesheets)
    - Creates the custom fields for Simple Form
    - You can use the 3 type of date & time pickers in your forms
    - You do not need to write any javascript or CSS code
    - The language automatically selected based on the locale
    - You can specify all the datetime-pickers options (weekStart, minDate, manDate, disabledDates, etc.)
    - The format of the date and time can be specified in the config/locales
    - You can customise the picker's iconset (dafault: Glyphicon) to use the Font-Awesome icons
    - Easy to install and use in your projects


### Compatibility

Tag v3.0.2+, eonasdan: Bootstrap 3+, Rails 4+ and SimpleForm 3.1.RC1+ (using https://github.com/eonasdan/bootstrap-datetimepicker.git as submodule, it is well maintained repo)

Tag v3.0.1, tarruda: Bootstrap 3+, Rails 4+ and SimpleForm 3.1.RC1+ (using an upgraded version of https://github.com/tarruda/bootstrap-datetimepicker.git as inline code, not maintained)

Tag v1.0.0: Rails 3.2, Bootstrap 2.3.2 & SimpleForm >= 2.0.4


### Dependency

The current versions (v3.0.2+) has a dependency on the moment.js javascript library (for details refer to: http://momentjs.com/).
The gem does not install this library out of the box, so you must look after that. The reason for not included in this gem the
installation of moment.js is if you use any package that includes this library (for instance fullcalendar) it would be double installed.

It is very easy to install this library by using the https://github.com/derekprior/momentjs-rails gem.


### Credits and references

The project is based on: https://github.com/tarruda/bootstrap-datetimepicker.git project, which was upgraded to Bootstrap 3+ compatible and refactored significantly by Eonasdan (see: https://github.com/eonasdan/bootstrap-datetimepicker.git).

The project home page: https://github.com/zpaulovics/datetimepicker-rails.git


### Installation

According your needs, add one of the lines below to your application's Gemfile:

    gem 'datetimepicker-rails', '>= 3.0.0', :git => 'git://github.com/zpaulovics/datetimepicker-rails.git',  \
        :branch => 'master', :submodules => true

    gem 'datetimepicker-rails', '>= 3.0.0', :git => 'git://github.com/zpaulovics/datetimepicker-rails.git', :branch => 'tarruda'

    gem 'datetimepicker-rails', github: 'git://github.com/zpaulovics/datetimepicker-rails.git', tag: '1.0.0'

then execute:

    $ bundle install


### Configuration

Add this line to app/assets/stylesheets/application.css

``` css
 *= require bootstrap-datetimepicker
or
 *= require bootstrap-datetimepicker.min

```

Add this line to app/assets/javascripts/application.js

``` javascript
//= require bootstrap-datetimepicker
```

You can fine tune the included files to suit your needs.

From version 3.0.2+:

```javascript
//= require bootstrap-datetimepicker
//= require pickers
//= require locales/bootstrap-datetimepicker.hu
```

Earlier version:

```javascript
//= require bootstrap-datetimepicker/core
//= require bootstrap-datetimepicker/pickers
//= require bootstrap-datetimepicker/locales/bootstrap-datetimepicker.hu
```


### Calling the generator

After you install 'datetimepicker' and add it to your Gemfile, you need to run the generator.
The generator will create the custom field definitions for Simple Form in your project. There are 3
custom field definitions. The generator look at the app/inputs directory of your project and create
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
if you want to use the default Glyphicon icons for the pickers, or execute the following command
```
  $ rails generate datetimepicker_rails:install Font-Awesome
```
to use the Font-Awesome icons for the pickers.

The current version will copy the required files to your projects 'vendor/assets' directory
(not to the gem's vendor/assets directory as before). That makes it possible to tailor by your projects
the SimpleForm 'input' and the 'pickers.js' files to your needs at your own area. That gives you much more
flexibility to use your preferred options of the bootstrap-datetimepicker plugin.

All available language files will be copied to your vendor/assets/locales directory.

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

<%= f.input :begin-at, :as => :time_picker %>
```

The scripts below will be included, when you use the "require pickers" or "require bootstrap-datetimepicker/pickers". If you
need different activation scripts, ignore the //= require pickers or //= require bootstrap-datetimepicker/pickers line
(depending on your installation) in app/assets/javascripts/application.js.

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
        dformat: '%d/%m/%Y'        # display format of the date (this is the default, can be ommited)
        pformat: 'DD/MM/YYYY'      # picking format of the date (this is the default, can be ommited)
        weekstart: 0               # the week starts on Sunday (this is the default, can be ommited)
      timepicker:
        dformat: '%R'              # display format of the time (this is the default, can be ommited)
        pformat: 'HH:mm'           # picking format of the time (this is the default, can be ommited)

For details of the 'pformat' attribute formatting templates, please refer to the moment.js documentation [here](http://momentjs.com/)


### For more details of usage

See the documentation & excellent demos provided by plugin's authors:

1. for current version: from [@Eonasdan](https://github.com/Eonasdan) the documentation is [here](http://eonasdan.github.io/bootstrap-datetimepicker/),

2. for earlier version: from [@tarruda](https://github.com/tarruda) the documentation is [here](http://tarruda.github.com/bootstrap-datetimepicker/).


### Bugfix - dataToOptions function in the bootstrap-datetimepicker.js

My SimpleForm custom field implementation assumes to work the data-date-* attributes correctly in the picker plugin.
I find out that, there is a bug in the dataToOptions function that prevents the perfect working of this gem.

Find the below code in the in the bootstrap-datetimepicker.js
```
        dataToOptions = function () {
            var eData
            if (picker.element.is('input')) {
                eData = picker.element.data();
            }
            else {
                eData = picker.element.data();
            }
```
The else part of the if statement should be the above live:
```
                eData = picker.element.find('input').data();
```
I have already raised a pull request of this fix. As soon as it will be accepted you can ignore this hacking.


### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
