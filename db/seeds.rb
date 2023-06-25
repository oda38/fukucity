# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.create!(
   email: 'fukucity@admin',
   password: 'fukucitytest'
)


users = User.create!(
  [
    {email: 'kuriyama_317@example.com', name: '栗山洋子', name_kana: 'クリヤマヨウコ', nickname: 'ようこ', password: 'password1', telephone_number: '05080121106',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {email: 'hideki_sugimoto@example.com', name: '杉本英樹', name_kana: 'スギモトヒデキ', nickname: 'ひで', password: 'password2', telephone_number: '07057821650',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    {email: 'abe310@example.com', name: '阿部いづみ',name_kana: 'アベイヅミ', nickname: 'あべべ', password: 'password3', telephone_number: '05090946277',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")}
  ]
)

Post.create!(
  [
    {title: 'プチ家庭菜園',
     content: '利用者さんと一緒に植えたトマトがこんなに成長しました！一緒に食べるのが楽しみです♪
   使ったもの：トマトの苗、支柱、ビニール針金、野菜と花の培養土
   おすすめポイント：水やりが利用者さんの役割になり、今や毎日の日課です！一仕事を終えた後には、ティータイムをするという一連の流れが私たちの楽しみになっています。',
     image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg"),
     is_draft: false,
     user_id: users[0].id},
     
    {title: 'お祭り準備',
     content: '園内の８月のお祭りに向けて準備中です。
   ３年ぶりの開催ということもあって、職員の気合いが入ります。使いまわせる道具は使いまわしています。
   定番のスーパーボール、フライドポテト、あとは何にしようかな、、、',
     image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.png"), filename:"sample-post2.png"),
     addition_images: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg"),
     is_draft: false,
     user_id: users[1].id}, 
     
  ]
)


Announcement.create!(
  [
    {title: '使い方１〜いいね機能〜',content: '気に入ったアイデア、やってみたいと思ったアイデアには「いいね」を押しておこう！
    「いいね」を押した投稿は、マイページの「いいねした投稿をみる」から見ることができます。',
      announcement_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/logo.png"), filename:"logo.png") },
  ]
)