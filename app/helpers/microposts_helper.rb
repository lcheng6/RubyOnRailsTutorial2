module MicropostsHelper
  def wrap(content)
    sanitize(raw(content.split.map{ |s| wrap_long_string(s) }.join(' ')))
    #raw(content.split.map{ |s| wrap_long_string(s) }.join(' '))
    #raw(content.split.map{ |s| wrap_long_string(s) })
  end

  private

  def wrap_long_string(text, max_width = 30)
    zero_width_space = "&#8203;"
    regex = /.{1,#{max_width}}/
    (text.length < max_width) ? text :
        text.scan(regex).join(zero_width_space)
  end

  def lat_long_formatter(num, decimals = 3)
    num.round(decimals)
  end

end
