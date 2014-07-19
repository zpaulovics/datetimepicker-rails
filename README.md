## SimpleForm & Bootstrap DateTimepicker for Rails

This version assumes: Rails 4, Boostrap 3+ & SimpleForm 3.1.RC1+

This gem packages the bootstrap-datetimepicker for Rails asset pipeline, and creates the Simple Form custom fields for your project.

The project home page: https://github.com/zpaulovics/datetimepicker-rails.git

The project is based on: https://github.com/tarruda/bootstrap-datetimepicker.git project as a git submodule


### Features

    - Prepares the vendor directory (javascripts, stylesheets)
    - Creates the custom fields for Simple Form
    - You can use the 3 type of date & time pickers in your forms
    - You do not need to write any javascript or CSS code
    - The language automatically selected based on the locale
    - You can specify the starting day of the week
    - The format of the date and time can be specified in the config/locales
    - Easy to install and use in your projects


### Installation

Add this line to your application's Gemfile:

    # SORRY! But the 'datetimepicker-rails' name in RubyGems repo already taken.

So install it from the git by:

    gem 'datetimepicker-rails', :require => 'datetimepicker-rails', :git => 'git://github.com/zpaulovics/datetimepicker-rails.git'

And then execute:

    $ bundle install

### Configuration

Add this line to app/assets/stylesheets/application.css

``` css
 *= require bootstrap-datetimepicker
```

Add this line to app/assets/javascripts/application.js

``` javascript
//= require bootstrap-datetimepicker
```

You can fine tune the included files to suit your needs.

```javascript
//= require bootstrap-datetimepicker/core
//= require bootstrap-datetimepicker/pickers
//= require bootstrap-datetimepicker/locales/bootstrap-datetimepicker.hu.js
```

### Calling the generator

After you install datetimepicker and add it to your Gemfile, you may need to run the generator.
The generator will create the custom field definitions for Simple Form in your project. There are 3
custom field definitions. The generator look at the app/inputs directory of your project and create
only those custom field definitions that are not already exists in your project. If you have a custom
input with the same name the generator does not overwrite it.

To run the generator is optional, it is up to you to write your own definitions for Simle Form if you
need it at all.

The datetimepicker-rails is using the following custom field definitions:

    datetime_picker_input.rb    # for fields with :as => :datetime_picker
    date_picker_input.rb        # for fields with :as => :date_picker
    time_picker_input.rb        # for fields with :as => :time_picker

To run the generator use the following command:

    $ rails generate datetimepicker_rails:install


### Using datetimepicker-rails

Just call datetimepicker() with any selector.

#### HTML

```html
<input class="datetimepicker" type="text" >

<script type="text/javascript">
    $('.datetimepicker').datetimepicker({
        language: 'hu',
    });
</script>
```

#### Simple_Form

```html
<%= f.input :start_date_time, :as => :datetime_picker %>

<%= f.input :closing_date, :as => :date_picker %>

<%= f.input :begin-at, :as => :time_picker %>
```

The scripts below will be included, when you use the "require bootstrap-datetimepicker/pickers". If you
need different activation scripts, ignore the //= require bootstrap-datetimepicker/pickers line in
app/assets/javascripts/application.js.

```javascript
    $('.datetimepicker').datetimepicker({
        pickSeconds: false
    });

    $('.timepicker').datetimepicker({
        pickDate: false,
        pickSeconds: false
    });

    $('.datepicker').datetimepicker({
        pickTime: false
    });
```

### Date and time formating

Specify your intended date and time formats in your config/locales/en.yml or related language file as follows:

    en:
      datepicker:
        dformat: '%d/%m/%Y'        # display format of the date (this is the default, can be ommited)
        pformat: 'dd/MM/yyyy'      # picking format of the date (this is the default, can be ommited)
        weekstart: 0               # the week starts on Sunday (this is the default, can be ommited)
      timepicker:
        dformat: '%R'              # display format of the time (this is the default, can be ommited)
        pformat: 'hh:mm'           # picking format of the time (this is the default, can be ommited)


### For more details of usage

See the excellent demo provided by plugin's author - [@tarruda](https://github.com/tarruda) [here](http://tarruda.github.com/bootstrap-datetimepicker/).


### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
