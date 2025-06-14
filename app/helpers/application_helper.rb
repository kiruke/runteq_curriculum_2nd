module ApplicationHelper
  def page_title
    if content_for?(:title)
      content_for(:title) + " | " + "RUNTEQ BOARD APP"
    else
      "RUNTEQ BOARD APP" 
    end
  end
end
