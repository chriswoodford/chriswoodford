module ContentHelpers
  def article_tag(&block)
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

  def section_tag(&block)
    body = capture_html(&block)
    content_tag(:section, body, class: "py-4")
  end

  def section_title(text)
    classes = %w(font-bold font-sans break-normal text-gray-900 text-2xl
                 md:text-3xl)
    content_tag(:h2, text, class: classes.join(" "))
  end

  def paragraph_tag(&block)
    content_tag(:p, class: "pb-4", &block)
  end

  def blockquote_tag(cite:, &block)
    classes = %w(border-l-4 border-indigo-500 italic my-8 pl-8 md:pl-12)
    content_tag(:blockquote, cite: cite, class: classes.join(" "), &block)
  end
end
