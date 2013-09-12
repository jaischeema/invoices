module UsersHelper
  def value_or_empty(value)
    if strip_tags(value).blank?
      "<span class='label label-danger'>Not configured</span>".html_safe
    else
      value.html_safe
    end
  end
end
