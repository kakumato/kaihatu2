class User < ApplicationRecord
    #名前、メールアドレス、パスワードの文字数制限
    has_secure_password
end
