class User < ActiveRecord::Base
  has_secure_password

  enum access_level: [:admin, :super_admin]

  has_many :domains
end