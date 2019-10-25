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
    content_tag(:section, class: "py-2", &block)
  end

  def section_title(text)
    classes = %w(font-bold font-sans break-normal text-gray-900 text-2xl
                 md:text-3xl my-4)
    content_tag(:h2, text, class: classes.join(" "))
  end

  def paragraph_tag(&block)
    content_tag(:p, class: "mb-4", &block)
  end

  def blockquote_tag(cite: "", &block)
    classes = %w(border-l-4 border-indigo-500 italic my-4 pl-8 md:pl-12
                 text-2xl)
    content_tag(:blockquote, cite: cite, class: classes.join(" "), &block)
  end

  def blockquote_cite(source:, reference: nil)
    capture = content_tag(:cite, "#{source}")
    content_tag(:footer, class: "text-base text-gray-600") do
      "&ndash; #{capture} #{reference}"
    end
  end

  def figure_tag(&block)
    content_tag(:figure, class: "flex flex-wrap mb-4 md:flex-no-wrap", &block)
  end

  def figure(src)
    image_tag(src, class: "object-left-top flex-1 lg:pr-4 lg:max-w-lg")
  end

  def caption_tag(number:, &block)
    classes = %w(text-sm italic border-l-4 border-gray-400 my-1 pl-4 self-start)
    text = "Figure #{number}: #{capture_html(&block)}"
    content_tag(:figcaption, text, class: classes.join(" "), &block)
  end
end
