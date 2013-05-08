module ApplicationHelper
  def markdown(text)
    if text.blank?
      nil
    else
      markdown_render = Redcarpet::Render::HTML.new(:hard_wrap => true, :no_styles => true)
      md = Redcarpet::Markdown.new(markdown_render, :autolink => true, :no_intro_emphasis => true)
      md.render(text).html_safe
    end
  end
#  def markdown(text)
#    GitHub::Markdown.render_gfm(text).to_html.html_safe
#  end
end
