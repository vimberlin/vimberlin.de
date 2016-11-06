xml.instruct! :xml, :version => '1.0'
xml.rss :version => "2.0",  'xmlns:atom' => "http://www.w3.org/2005/Atom" do
  xml.channel do
    xml.title "Vimberlin"
    xml.description "The gathering for Vim-enthusiasts in Berlin"
    xml.link "http://vimberlin.com/"
    site_url = "http://vimberlin.com/"
    blog.articles.each do |article|
      xml.item do
        xml.title article.title
        xml.link URI.join(site_url, article.url)
        xml.description article.body
        xml.pubDate article.date.to_date.rfc822
        xml.guid URI.join(site_url, article.url)
      end
    end
  end
end
