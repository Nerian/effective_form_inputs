# Effective Form Inputs

Multiple custom Rails Form Helper and SimpleForm inputs in one Rails engine.

This gem contains numerous custom form inputs along with their Javascript/CSS assets.

Each included form input is available to both the default Rails Form Helper and SimpleForm.

Rails 3.2.x and 4.x

## Getting Started

Add to your Gemfile:

```ruby
gem 'effective_form_inputs'
```

Run the bundle command to install it:

```console
bundle install
```

### Install All Form Inputs

This gem packages the javascript/css assets for numerous form inputs.

The assets for these inputs may be included all at once or individually.

To install all available inputs, add the following to your application.js:

```ruby
//= require effective_form_inputs
```

and add the following to your application.css:

```ruby
*= require effective_form_inputs
```

All of the included form inputs will now be available with no additional installation tasks.

### Options Passing to JavaScript

All `:input_js => options` passed to any effective_form_input will be used to initialize the Javascript library

For example:

```ruby
= form_for @user do |f|
  = f.effective_date_time_picker :updated_at, :input_js => {:format => 'dddd, MMMM Do YYYY', :showTodayButton => true}
```

or

```ruby
= simple_form_for @user do |f|
  = f.input :updated_at, :as => :effective_date_time_picker, :input_js => {:format => 'dddd, MMMM Do YYYY', :showTodayButton => true}
```

will result in the following call to the Javascript library:

```coffee
$('input.effective_date_time_picker').datetimepicker
  format: 'dddd, MMMM Do YYYY',
  showTodayButton: true
```

Any options passed in this way will be used to initialize the underlying javascript libraries.


## Effective Date Time Picker

This custom form input is based on the following awesome project:

Bootstrap 3 Datepicker (https://github.com/Eonasdan/bootstrap-datetimepicker)


### Installation

If you've already installed the 'All Form Inputs' assets (see above), there are no additional installation steps.

To install this form input individually, add the following to your application.js:

```ruby
//= require effective_date_time_picker/input
```

and add the following to your application.css:

```ruby
*= require effective_date_time_picker/input
```

### Usage

As a Rails Form Helper input:

```ruby
= form_for @user do |f|
  = f.effective_date_time_picker :updated_at
```

As a SimpleForm input:

```ruby
= simple_form_for @user do |f|
  = f.input :updated_at, :as => :effective_date_time_picker
```

As a SimpleForm input without the input group (calendar glyphicon)

```ruby
= simple_form_for @user do |f|
  = f.input :updated_at, :as => :effective_date_time_picker, :input_group => false
```

### Options

The default `:input_js => options` used to initialize this form input are as follows:

```ruby
:input_js => {:format => 'YYYY-MM-DD h:mm A', :sideBySide => true}
```

For a full list of options, please refer to:

http://eonasdan.github.io/bootstrap-datetimepicker/Options/


## Effective Date Picker

This custom form input is based on the following awesome project:

Bootstrap 3 Datepicker (https://github.com/Eonasdan/bootstrap-datetimepicker)


### Installation

If you've already installed the 'All Form Inputs' assets (see above), there are no additional installation steps.

To install this form input individually, add the following to your application.js:

```ruby
//= require effective_date_picker/input
```

and add the following to your application.css:

```ruby
*= require effective_date_picker/input
```

### Usage

As a Rails Form Helper input:

```ruby
= form_for @user do |f|
  = f.effective_date_picker :started_on
```

As a SimpleForm input:

```ruby
= simple_form_for @user do |f|
  = f.input :started_on, :as => :effective_date_picker
```

As a SimpleForm input without the input group (calendar glyphicon)

```ruby
= simple_form_for @user do |f|
  = f.input :updated_at, :as => :effective_date_picker, :input_group => false
```

### Options

The default `:input_js => options` used to initialize this form input are as follows:

```ruby
:input_js => {:format => 'YYYY-MM-DD'}
```

For a full list of options, please refer to:

http://eonasdan.github.io/bootstrap-datetimepicker/Options/


## Effective Static Control

A bootstrap3 Static control input

Renders `<p class='form-control-static'>value</p>` with the appropriate SimpleForm wrappings.

### Installation

There are no installation steps required for this form input

### Usage

As a Rails Form Helper input:

```ruby
= form_for @user do |f|
  = f.effective_static_control :member_id
```

As a SimpleForm input:

```ruby
= simple_form_for @user do |f|
  = f.input :member_id, :as => :effective_static_control
```

### Options

There are no default options for this form input


## Effective Select

This custom form input is based on the following awesome project:

Select2 (https://select2.github.io/)


### Installation

If you've already installed the 'All Form Inputs' assets (see above), there are no additional installation steps.

To install this form input individually, add the following to your application.js:

```ruby
//= require effective_select/input
```

and add the following to your application.css:

```ruby
*= require effective_select/input
```

### Usage

As a Rails Form Helper input:

```ruby
= form_for @user do |f|
  = f.effective_select :category, 10.times.map { |x| "Category #{x}"}
  = f.effective_select :categories, 10.times.map { |x| "Category #{x}"}, :multiple => true
  = f.effective_select :categories, 10.times.map { |x| "Category #{x}"}, :tags => true
```

and as a SimpleForm input:

```ruby
= simple_form_for @user do |f|
  = f.input :category, :as => :effective_select, :collection => 10.times.map { |x| "Category #{x}"}
  = f.input :categories, :as => :effective_select, :collection => 10.times.map { |x| "Category #{x}"}, :multiple => true
  = f.input :categories, :as => :effective_select, :collection => 10.times.map { |x| "Category #{x}"}, :tags => true
```

### Modes

The standard mode is a replacement for the default single select box.

Passing `:multiple => true` will allow multiple selections to be made.

Passing `:multiple => true, :tags => true` will allow multiple selections to be made, and new value options to be created.  This will allow you to both select existing tags and create new tags in the same form control.

Passing `:grouped => true` will enable optgroup support.  When in this mode, the collection should be a Hash of Array of Arrays

```ruby
:collection => {'Active' => [['Post A', 1], ['Post B', 2]], 'Past' => [['Post C', 3], ['Post D', 4]]}
```

### Options

The default `:input_js => options` used to initialize this form input are as follows:

```ruby
{
  :theme => 'bootstrap',
  :minimumResultsForSearch => 6,
  :tokenSeparators => [',', ' '],
  :width => 'style',
  :placeholder => 'Please choose',
  :allowClear => !(options[:multiple])  # Only display the Clear 'x' on a single selection box
}
```

### Interesting Available Options

To limit the number of items that can be selected in a multiple select box:

```ruby
:maximumSelectionLength => 2
```

To hide the search box entirely:

```ruby
:minimumResultsForSearch => 'Infinity'
```

For a full list of options, please refer to:

https://select2.github.io/options.html


### AJAX Support

There is currently no support for using AJAX to load remote data.  This feature is supported by the underlying select2 library and will be implemented here at a future point.


## Effective Tel(ephone)

This custom form input uses a jQuery maskedInput plugin from the following awesome project:

http://digitalbush.com/projects/masked-input-plugin/

https://github.com/digitalBush/jquery.maskedinput


### Installation

If you've already installed the 'All Form Inputs' assets (see above), there are no additional installation steps.

To install this form input individually, add the following to your application.js:

```ruby
//= require effective_tel/input
```

and add the following to your application.css:

```ruby
*= require effective_tel/input
```

### Usage

As a Rails Form Helper input:

```ruby
= form_for @user do |f|
  = f.effective_tel :phone
```

As a SimpleForm input:

```ruby
= simple_form_for @user do |f|
  = f.input :phone, :as => :effective_tel
```

As a SimpleForm input without the input group (phone glyphicon)

```ruby
= simple_form_for @user do |f|
  = f.input :phone, :as => :effective_tel, :input_group => false
```

## Effective Price

This custom form input uses no 3rd party jQuery plugins.

It displays a currency formatted value `100.00` but posts the "price as integer" value of `10000` to the server.

Think about this value as "the number of cents".


### Installation

If you've already installed the 'All Form Inputs' assets (see above), there are no additional installation steps.

To install this form input individually, add the following to your application.js:

```ruby
//= require effective_price/input
```

### Usage

As a Rails Form Helper input:

```ruby
= form_for @product do |f|
  = f.effective_price :price
```

As a SimpleForm input:

```ruby
= simple_form_for @product do |f|
  = f.input :price, :as => :effective_price
```

As a SimpleForm input without the input group (glyphicon-usd glyphicon)

```ruby
= simple_form_for @product do |f|
  = f.input :price, :as => :effective_price, :input_group => false
```

### Options

There are no javascript options for this input.


### Rails Helper

This input also installs a rails view helper `price_to_currency` that takes a value like `10000` and displays it as `$100.00`


## License

MIT License.  Copyright [Code and Effect Inc.](http://www.codeandeffect.com/)

Code and Effect is the product arm of [AgileStyle](http://www.agilestyle.com/), an Edmonton-based shop that specializes in building custom web applications with Ruby on Rails.


## Credits

The authors of this gem are not associated with any of the awesome projects used by this gem.

We are just extending these existing community projects for ease of use with Rails Form Helper and SimpleForm.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Bonus points for test coverage
6. Create new Pull Request
