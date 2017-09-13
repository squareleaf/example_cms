module ContactsHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = column == column_sort && direction_sort == "asc" ? "desc" : "asc"
    link_to title, {sort: column, direction: direction}
  end
end
