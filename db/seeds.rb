User.create!(name:  "山田 太郎",
  email: "sample@example.com",
  password:              "foobar",
  password_confirmation: "foobar")
  admin: true)

99.times do |n|
name  = Faker::Name.name
email = "sample-#{n+1}@example.com"
password = "password"
User.create!(name:  name,
    email: email,
    password:              password,
    password_confirmation: password)
end

10.times do |n|
  Post.create!(name: Faker::Food.dish,
               description: "素敵な洋食屋さんです",
               reference: "https://goo.gl/maps/mVCZD5vHJ9j9dsRg6",
               memo: "初めて行きました！"
               user_id: 1)
end