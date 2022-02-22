module ApplicationHelper
  def page_title(page_title = '')
    base_title = '短冊日記'

    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end
end
