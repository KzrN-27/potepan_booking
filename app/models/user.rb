class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: {minimum: 6}, on: :create
    validates :password, presence: true, length: {minimum: 6}, on: :update, if: :validate_password?
    mount_uploader :image, ImageUploader

    private

    def validate_password?
        password.present?
    end
end
