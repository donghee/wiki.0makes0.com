# define the wiki options
wiki_options = {
  :h1_title => true,
  :user_icons => 'gravatar',
  :live_preview => false,
  :allow_uploads => true,
  :per_page_uploads => true,
  :allow_editing => true,
  :css => true,
  :js => true,
  :mathjax => true,
  :emoji => true,
  :show_all => true,
  :template_dir => '/usr/local/share/gollum/templates'
}

# pass wiki options to the Gollum app
Precious::App.set(:wiki_options, wiki_options)

# if present, undefine the :FORMAT_NAMES constant to avoid the
# "already initialized constant FORMAT_NAMES" warning
Gollum::Page.send :remove_const, :FORMAT_NAMES if defined? Gollum::Page::FORMAT_NAMES
# redefine the :FORMAT_NAMES constant to limit the available
# formats on the editor to only markdown
Gollum::Page::FORMAT_NAMES = { :markdown => "Markdown" }

module Gollum
  class Markup
    mmd = proc { |content|
     MultiMarkdown.new(content).to_html
    }
    GitHub::Markup::Markdown::MARKDOWN_GEMS['kramdown'] = proc { |content|
        Kramdown::Document.new(content, :input => "kramdown", :auto_ids => true, :math_engine => nil, :smart_quotes => ["'", "'", '"', '"'].map{|char| char.codepoints.first}).to_html
    } 
  end
end

