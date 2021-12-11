# frozen_string_literal: true

module ApplicationHelper
  # Возвращет название страницы
  def full_title(certain = '')
    return "#{certain} | СПб" if certain.present? # present? - проверяет на наличии содержимого. Метод rails

    'Главная'
  end

  # Возвращает текс шапки в зависимости от переданного аргумента
  def site_header(name_site_header)
    return "#{name_site_header.title} район" if name_site_header == @district

    name_site_header
  end
end
