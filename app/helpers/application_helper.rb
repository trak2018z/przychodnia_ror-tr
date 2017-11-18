module ApplicationHelper
  def flash_class(level) # funkcja pomocnicza do ustalania klasy informacji typu flash
    case level
      when 'notice' then "alert alert-info"
      when 'success' then "alert alert-success"
      when 'error' then "alert alert-danger"
      when 'alert' then "alert alert-warning"
    end
  end

  def errors_for(object)
    if object.errors.any?
        content_tag(:div, class: "panel panel-danger") do
            concat(content_tag(:div, class: "panel-heading") do
                concat(content_tag(:h4, class: "panel-title") do
                    #concat "#{pluralize(object.errors.count, "error")} prohibited this #{object.class.name.downcase} from being saved:"
                    concat "Aby zapisać się na wizytę popraw następującę błędy:"
                end)
            end)
            concat(content_tag(:div, class: "panel-body") do
                concat(content_tag(:ul) do
                    object.errors.messages.values.each do |msg|
                      msg.each do |m|
                        concat content_tag(:li, m)
                      end
                    end
                end)
            end)
        end
    end
end
end
