module StaticPagesHelper
  def create_title(page_title)

    if page_title.present?
      base_title + ' | ' + page_title
    else
      base_title
    end
  end

  private
  def base_title
    'ISL fantasy'
  end
end
