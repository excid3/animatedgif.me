module GifsHelper
  def tag_links(gif)
    gif.tags.map do |tag|
      link_to tag.name, tagged_gifs_path(tag.name)
    end.join(", ").html_safe
  end
end
