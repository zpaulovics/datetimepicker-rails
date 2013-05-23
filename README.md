## SimpleForm & Bootstrap DateTimepicker for Rails

This gem packages the bootstrap-datetimepicker for Rails asset pipeline, and creates the Simple Form custom fields for your project

The project home page: https://github.com/zpaulovics/datetimepicker-rails.git

The project is based on: https://github.com/tarruda/bootstrap-datetimepicker.git project as a git submodule


### Features

    - Prepares the vendor directory (javascripts, stylesheets)
    - Install the custom fields for Simple Form


### Installation

Add this line to your application's Gemfile:

    gem 'datetimepicker-rails'

Or install it yourself from the latest build as:

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
The generate will copy the custom fields definitions for Simple Form in your project. There are 3
custom field definition. The generator look at the app/inputs directory of your project and copy
only those custom field definition that is not already exists in your project. If you have a custom
input with the same name the generator does not overwrite it.

To run the generator is optional, it is up to you to write your own definitions for Simle Form if you
need it at all. You do not need to call the install

The datetimepicker-rails using the following custom field definitions:

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
        format: 'yyyy/MM/dd hh:mm',
        language: 'hu',
        autoclose: true
    });
</script>
```

#### Simple_Form

```html
<%= f.input :start_date_time, :as => :datetime_picker %>

<%= f.input :closing_date, :as => :date_picker %>

<%= f.input :begin-at, :as => :time_picker %>
```

The scripts below will be included by require bootstrap-datetimepicker/pickers accordingly. If you
need different activation scripts, ignore the //= require bootstrap-datetimepicker/pickers line in
app/assets/javascripts/application.js

```javascript
<   $('.datetimepicker').datetimepicker({
        format: 'yyyy/MM/dd hh:mm',
        language: 'hu',
        autoclose: true
    });

    $('.timepicker').datetimepicker({
        format: 'hh:mm',
        language: 'hu',
        pickDate: false,
        autoclose: true
    });

    $('.datepicker').datetimepicker({
        format: 'yyyy/MM/dd',
        language: 'hu',
        pickTime: false,
        autoclose: true
    });
```

### For more details of usage

See the excellent demo provided by plugin's author - [@tarruda](https://github.com/tarruda) [here](http://tarruda.github.com/bootstrap-datetimepicker/).


### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
