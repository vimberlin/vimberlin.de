require 'date'

module Jekyll
  class RenderNextMeetup < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
    end

    def render(context)
      next_event = context.registers[:site].posts.docs
                .select  do |page| page.data['layout'] == 'meetup' end
                .select  do |page| Time.parse(page.data['when']) >= Time.now end
                .sort_by do |page| page.data['when'] end
                .first

      if next_event.nil? then
        return "TBA"
      else
        loc = context.registers[:site].config['locations'][next_event.data['where']]
        time = Time.parse(next_event.data['when']).strftime("%B, %eth %Y %l:%M %P")
        # it doesn't support templates here :(
        result = ""
        result += "<a href='#{next_event.url}'>#{next_event.data['title']}</a>:"
        result += " #{time}"
        result += " at <a href='#{loc["url"]}'>#{loc["name"]}</a>"
        return result
      end
    end
  end
end

Liquid::Template.register_tag('next_meetup', Jekyll::RenderNextMeetup)

