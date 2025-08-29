# boards ...
puts 'boards...'
10.times do |n|
  board = Board.create!(
    title: "掲示板 #{n + 1}",
    # スキーマに合わせて description を body に変更し、Faker でデータを生成
    body: Faker::Lorem.paragraph,
    user: User.order("RANDOM()").first
  )

  # comments ...
  puts "comments for board #{board.id}..."
  3.times do |m|
    Comment.create!(
      # スキーマに合わせて content を body に変更し、Faker でデータを生成
      body: Faker::Lorem.paragraph,
      board: board,
      user: User.order("RANDOM()").first
    )
  end
end