module ContentHelpers
  def article(&block)
    classes = %w(w-full px-4 md:px-6 text-xl text-gray-800 leading-normal)
    content_tag(:article, class: classes.join(" "), &block)
  end

  def article_header(&block)
    content_tag(:header, class: "py-4", &block)
  end

  def article_title(text)
    classes = %w(font-bold font-sans break-normal text-gray-900 text-3xl
                 md:text-4xl)
    content_tag(:h1, text, class: classes.join(" "))
  end

  def article_section(&block)
    body = capture_html(&block)
    content_tag(:section, body, class: "py-4")
  end

  def article_paragraph(&block)
    content_tag(:p, class: "pb-4", &block)
  end
end
