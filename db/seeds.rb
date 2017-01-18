['user_one@mail.com', 'user_two@mail.com'].each { |email| User.create(email: email, password: "asdfasdf", password_confirmation: "asdfasdf") }
