# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  first_name      :string
#  last_name       :string
#  birthday        :date
#  gender          :string
#  game            :string
#  ign             :string
#  role            :string
#  mains           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    after_initialize :ensure_session_token

    validates :email, :password_digest, :session_token, presence: true
    validates :email, :session_token, uniqueness: true
    validates :password, length: { minimum: 8 }, allow_nil: true

    attr_reader :password

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)
        return nil unless user
        user.is_password?(password) ? user:nil
    end

    def reset_session_token!
        generate_session_token
        save!
        self.session_token
    end

    private

    def new_session_token
        SecureRandom.urlsafe_base64
    end

    def ensure_session_token
        generate_session_token unless self.session_token
    end

    def generate_session_token
        self.session_token = new_session_token
        while User.find_by(session_token: self.session_token)
            self.session_token = new_session_token
        end
        self.session_token
    end

end
