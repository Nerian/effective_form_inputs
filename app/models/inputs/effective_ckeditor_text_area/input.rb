module Inputs
  module EffectiveCkeditorTextArea
    class Input < Effective::FormInput
      delegate :content_tag, :text_area_tag, :asset_path, :to => :@template

      def default_input_js
        {
          effective_assets: defined?(EffectiveAssets).present?,
          effective_ckeditor_js_path: asset_path('effective_ckeditor.js'),
          effective_ckeditor_css_path: asset_path('effective_ckeditor.css'),
          contentsCss: (options[:contentCss] || "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"),
          toolbar: options[:toolbar],
          height: options[:height],
          width: options[:width]
        }.compact
      end

      def default_input_html
        {class: 'effective_ckeditor_text_area text'}
      end

      def to_html
        text_area_tag(field_name, value, tag_options)
      end
    end
  end
end

