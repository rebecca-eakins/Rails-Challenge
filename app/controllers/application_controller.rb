class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_tags
  add_flash_types :success, :error

  def set_tags
    column_size = (Tag.all.count / 2).ceil
    if column_size > 0
      @tag_sets = Tag.all.in_groups_of(column_size)
    else
      @tag_sets = [[], []]
    end
  end
end
