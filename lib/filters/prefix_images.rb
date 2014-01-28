require 'nanoc'
require 'nokogiri'

# Prefixes all image URLs within guides with current version, so that we don't have to.
class PrefixImages < Nanoc::Filter

  identifier :prefix_images

  def run(content, params={})
    parsed_content = Nokogiri::HTML::DocumentFragment.parse(content)
    parsed_content.css("img").each do |img|
      img["src"] = "/#{@item[:version]}#{img["src"]}"
    end

    parsed_content.to_s
  end
end