module Jekyll
  class RenderLocation < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @addition_overwrite = text
    end

    def render(context)
      # is there no pretty way to access the page?
      page = context.environments.first["page"]
      # is there no pretty way to access the config?
      loc = context.registers[:site].config['locations'][page['where']]
      addition = if @addition_overwrite != "" then @addition_overwrite else loc["addition"] end

      # TODO: refactor to remove ugly strings
      where = if loc["url"].nil? then
                "<span itemprop='name'>#{loc["name"]}</span> #{addition}"
              else
                "<a itemprop='url' href='#{loc["url"]}'>
                <span itemprop='name'>#{loc["name"]}</span>
                </a> #{addition}"
              end

<<DOC
  <div itemprop="location" itemscope itemtype="http://schema.org/PostalAddress">
    <div>#{where}</div>
    <div itemprop="streetAddress">#{loc["street"]}</div>
    <div>
      <span itemprop="postalCode">#{loc["postalcode"]}</span>
      <span itemprop="addressLocality">#{loc["city"]}</span>
    </div>
    <meta itemprop="addressCountry" content=#{loc["country"]} />
    (<a href="#{loc["map"]}">map</a>)
  </div>
DOC
    end
  end
end

Liquid::Template.register_tag('location', Jekyll::RenderLocation)

