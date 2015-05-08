module ApplicationHelper
  def page_name
    @page_name || "Rails Based Blog"
  end

  def page_description
    @page_description || "This is my rails blog!"
  end

  def page_keywords
    @page_keywords || "Rails Blog SEO-Optimized Default Keyword Placeholders"
  end
end
