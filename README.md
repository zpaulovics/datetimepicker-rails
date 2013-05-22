# SimpleForm & Bootstrap DateTimepicker for Rails

This gem packages the bootstrap-datetimepicker for Rails 3.1+ asset pipeline, and creates the Simple Form custom fields for your project

## Installation

Add this line to your application's Gemfile:

    gem 'datetimepicker-rails'

Or install it yourself from the latest build as:

    gem 'datetimepicker-rails', :require => 'datetimepicker-rails', :git => 'git://github.com/zpaulovics/datetimepicker-rails.git'

And then execute:

    $ bundle install

## Configuration

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
//= require bootstrap-datetimepicker/locales/bootstrap-datetimepicker.hu.js
```

## Using datetimepicker-rails

Just call datetimepicker() with any selector.

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

```Simple_Form
<%= f.input :start_date_time, :as => :datetime_picker %>

<script type="text/javascript">
    $('.datetimepicker').datetimepicker({
        format: 'yyyy/MM/dd hh:mm',
        language: 'hu',
        autoclose: true
    });
</script>
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
