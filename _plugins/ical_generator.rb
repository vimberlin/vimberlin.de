require 'pathname'
require 'ri_cal'
require 'tzinfo'
require 'nokogiri'

module Jekyll
  class StaticICalFile < StaticFile
    def write(dest)
      super(dest) rescue ArgumentError
      true
    end
  end

  class ICalGenerator < Generator
    safe true
    priority :low

    def generate(site)
      # Create the destination folder if necessary.
      site_folder = site.config['destination']
      unless File.directory?(site_folder)
        p = Pathname.new(site_folder)
        p.mkdir
      end

      calendar = RiCal.Calendar do |cal|
        cal.default_tzid = "Europe/Berlin"
        #cal.x_wr_calname = "VimBerlin"
        site.site_payload['site']['posts'].each do |post|
          if post.data['layout'] == "event" then
            # XXX: is there no fucking way to get the rendered content of a site?
            payload = {'page' => post.to_liquid }
            info = { :filters => [Jekyll::Filters], :registers => { :site => site, :page => payload['page'] } }
            content = Liquid::Template.parse(post.content).render!(payload, info)

            loc = site.config['locations'][post.data['where']]
            location = "#{loc["name"]}, #{loc["street"]}, #{loc["postalcode"]} #{loc["city"]}, #{loc["country"]}"

            cal.event do |event|
              event.summary     = post.title
              event.description = Nokogiri::HTML(content).text # ugly hack to textify html
              event.dtstart     = Time.parse post.data['when']
              event.dtend       = Time.parse post.data['ends']
              event.location    = location
              event.url         = site.config['siteurl'] + post.url
            end
          end
        end
      end

      File.open(File.join(site_folder, 'vimberlin.ics'), 'w') do |f|
        f.puts calendar.to_s
      end

      # Add a static file entry for the zip file, otherwise Site::cleanup will remove it.
      site.static_files << Jekyll::StaticICalFile.new(site, site.dest, '/', 'vimberlin.ics')
    end
  end
end

