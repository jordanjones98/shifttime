class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :add_mailchimp_subscriber
       def add_mailchimp_subscriber
         client = Mailchimp::API.new('e15f311a914632462acd007c39feb359-us13')
         client.lists.subscribe('8a30f128fa', {email: email})
       end
end
