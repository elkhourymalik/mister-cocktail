class Cocktail < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, presence: true
  validates :name, uniqueness: true

  rails_admin do
      configure :user do
        label 'Owner of this cocktail: '
      end
    end
end
