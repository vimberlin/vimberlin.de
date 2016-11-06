module SiteHelpers

  # Used to check if a link goes to the current page by passing in a nav and
  # subnav string to check against the frontmatter within data.page.
  def current?(nav)
    nav == current_resource.data.nav
  end

  def blog_entry?()
    ['absolventa', 'berlinonline', 'bitcrowd', 'buero20', 'inberlin', 'intimes', 'launchco', 'launchco_new', 'matthias', 'thoughtworks', 'travis', 'wooga', 'wunderlist'].include? current_resource.data.where
  end

  def location
    current_resource.data.where
  end

  def title
    current_resource.data.title
  end

  def page_title
    (current_resource.data.title.blank? ? '' : "#{current_resource.data.title} - ") + project_setting(:title)
  end

  # Creates a description meta tag based on the presence of a description value within the page frontmatter.
  def page_description
    description = current_resource.data.description ? current_resource.data.description : current_resource.data.title + ' - ' + project_setting(:title)
    "<meta name=\"description\" content=\"#{description}\">"
  end

  # Creates a link only if the condition returns true, otherwise returns only the element.
  def link_to_if(condition, element, link)
    if condition
      link_to(element, link)
    else
      element
    end
  end
  # Calls appropriate key in /data/config.yml depending on current environment.
  def location_setting(place, key)
    data.config[config[:environment]][:locations][place][key]
  end

  # Calls appropriate key in /data/config.yml depending on current environment.
  def project_setting(key)
    data.config[config[:environment]][key]
  end

  def count_comments(article_name)
    name = article_name.downcase.gsub("\s", "-")
    %x[ls hashover/pages/#{name}-/ | wc -l]
  end


  def next_event
    announcement = "<h3>Next meetup "
    latest_blog_entry = blog.articles.first

    if Time.parse(latest_blog_entry.data['when']) >= Time.now
      location = latest_blog_entry.data['where']
      time = Time.parse(latest_blog_entry.data['when']).strftime("%B %eth, %Y %l:%M %P")
      announcement << "<a href='#{latest_blog_entry.url}'>#{time}</a> "
      announcement << "at <a href='#{data.config[config[:environment]][:locations][location]['url']}'>#{location.capitalize}</a> "
      announcement << "("
      announcement << link_to("#{count_comments(latest_blog_entry.title)} #{count_comments(latest_blog_entry.title).to_i <= 1? "Comment": "Comments"}", latest_blog_entry.url + "#comments")
      announcement << ")</h3>"
      if latest_blog_entry.data['topics']
        announcement << "<h3>Topics</h3>"
        announcement << "<ul>"
        latest_blog_entry.data['topics'].each do |topic|
          announcement << "<li>#{topic}</li>"
        end
      end
      return announcement
    end

    return announcement << 'TBA</h3>'
  end
end
