# frozen_string_literal: true

# Генерирует случайные ответы с помощью Fiker
30.times do
  name = Faker::Name.middle_name
  body = Faker::Lorem.paragraph(sentence_count: 5, supplemental: true,
                                random_sentences_to_add: 4)
  2.times { |id| Review.create name: name, body: body, district_id: id + 1 }
end
