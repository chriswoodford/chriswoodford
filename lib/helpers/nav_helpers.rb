module NavHelpers
  def nav_item(text, path, selected: false)
    classes = %w(no-underline border-b-2 border-transparent uppercase
                 tracking-wide font-bold text-xs py-3 mx-3)
    classes << nav_item_selection_classes(selected: selected)
    link_to(text, path, class: classes.join(" "))
  end

  def nav_item_selected?(name, current_section)
    name.downcase == current_section.downcase
  end

  def nav_item_selection_classes(selected: false)
    if selected
      %w(text-black-600 border-indigo-800)
    else
      %w(text-gray-600)
    end
  end
end
