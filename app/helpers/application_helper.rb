module ApplicationHelper
	def sortable(column, title = nil)
		title ||= column.titleize
		css_class = column == sort_column ? "current #{sort_direction}" : nil
		directtion = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
		link_to title, :sort => column, :direction => directtion
	end
end
