require 'sting'

module CustomHelpers
  def title_with(text)
    text ? "#{text} - #{settings.title}" : "#{settings.title} - #{settings.subtitle}"
  end

  def settings
    @settings ||= settings!
  end

  def markdown_file(name)
    file = "source/_markdown/#{name}.md"
    text = File.read file
    Kramdown::Document.new(text).to_html
  end

private

  def settings!
    result = Sting.new
    result << 'config'
    result
  end
end
