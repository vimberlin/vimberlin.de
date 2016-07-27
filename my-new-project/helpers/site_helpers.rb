module SiteHelpers

  # Used to check if a link goes to the current page by passing in a nav and
  # subnav string to check against the frontmatter within data.page.
  def current?(nav)
    nav == current_resource.data.nav
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

  def next_event
    announcement = "<h2>Our next meetup: "
    latest_blog_entry = blog.articles.first

    if Time.parse(latest_blog_entry.data['when']) >= Time.now
     location = latest_blog_entry.data['where']
     time = Time.parse(latest_blog_entry.data['when']).strftime("%B %eth, %Y %l:%M %P")
     announcement << "on the <a href='#{latest_blog_entry.url}'>#{time}</a>"
     announcement << " at <a href='#{data.config[config[:environment]][:locations][location]['url']}'>#{location.capitalize}</a></h2>"
     return announcement
    end

    return announcement << 'TBA</h2>'
  end
end
