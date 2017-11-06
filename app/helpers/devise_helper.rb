module DeviseHelper
  def devise_error_messages! # funkcja do tworzenia informacji o błędach przy wykonywaniu akcji na formularzu
    return '' if resource.errors.empty? # sprawdzenie czy formularz zawiera błędy

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join # tworzenie kolejnych elementów listy błędów
    sentence = I18n.t('errors.messages.not_saved', # tworzenie stosownej informacji o błędach
      count: resource.errors.count, # liczba błędów
      resource: resource.class.model_name.human.downcase) # utworzenie nazwy modelu przetwarzanego zasobu rozpoczynającej się od małej litery
    # utworzenie zbiorczej wiadomości informującej o błędach (z możliwością usunięcia przez przycisk "x")
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">x</button>
      <h4>#{sentence}</h4>
      #{messages}
    </div>
    HTML

    html.html_safe #
  end
end
