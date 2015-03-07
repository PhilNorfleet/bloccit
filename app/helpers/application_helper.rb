module ApplicationHelper
  def markdown_to_html(markdown)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render markdown).html_safe
  end

  def up_vote_link_classes(post)
    if current_user.voted(post) && current_user.voted(post).up_vote?
      voted = 'voted'
    else
      voted = ''
    end
    "glyphicon glyphicon-chevron-up #{voted}"
  end

  def down_vote_link_classes(post)
    if current_user.voted(post) && current_user.voted(post).down_vote?
      voted = 'voted'
    else
      voted = ''
    end
    "glyphicon glyphicon-chevron-down #{voted}"
  end
end
