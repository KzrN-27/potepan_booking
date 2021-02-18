class Room < ApplicationRecord
    belongs_to :user

    validates :name, presence: true, on: :create
    validates :introduce, presence: true, on: :create
    validates :price, presence: true, on: :create
    validates :area, presence: true, on: :create
    validates :image, presence: true, on: :create
    validates :start, presence: true, on: :update
    validates :end, presence: true, on: :update
    validates :num, presence: true, on: :update

    mount_uploader :image, ImageUploader
end
