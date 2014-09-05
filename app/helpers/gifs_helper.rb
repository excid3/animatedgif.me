module GifsHelper
  def tag_links(gif)
    gif.tags.map do |tag|
      link_to tag.name, tagged_gifs_path(tag.name)
    end.join(", ").html_safe
  end

  def gif_link(gif, options={})
    options.merge!(id: "gif", data: {})
    options[:data][:prev] = gif_path(@prev_gif) if @prev_gif
    options[:data][:next] = gif_path(@next_gif) if @next_gif

    link_to image_tag(@gif.url, class: "img-responsive centered"), @gif.url, options
  end
end
