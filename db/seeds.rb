puts '~> Create user'

user = User.create(
  email: "gpt_user@goldenowl.asia",
  password: 'password123'
)

