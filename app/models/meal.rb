class Meal < ApplicationRecord
  belongs_to :user
  has_many :ingredients, dependent: :destroy
  MEAL_KIND = ['Pequeno-Almoço', 'Lanche da Manhã', 'Almoço', 'Lanche', 'Jantar', 'Ceia']
end
