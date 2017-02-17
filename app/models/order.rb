class Order < ApplicationRecord
    before_create :generate_token

    def generate_token
        self.token = SecureRandom.uuid
    end
    alias_attribute :shipping_address, :address
    belongs_to :user
    validates :billing_name, presence: true
    validates :billing_address, presence: true
    validates :shipping_name, presence: true
    validates :shipping_address, presence: true

    has_many :product_lists
end
