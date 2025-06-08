class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :board

  validates :body, presence: true, length: { maximum: 65535 }

  def is_mine?(current_user)
    self.user == current_user
  end
  
    # 今回確認用に新しく追加するメソッド
  def who_am_i
    puts "私は誰でしょう？: #{self}"
    puts "私のクラスは？: #{self.class}"
    puts "私のIDは？: #{self.id}" # ApplicationRecordを継承している場合
    puts "私のユーザーは？: #{self.user.decorate.full_name}" # userがある場合
    self # 最後に自分自身を返すこともできます
  end

    # デバッグ用のメソッド
  def show_my_self
    puts "メソッド内部の self は: #{self.inspect}"
    puts "メソッド内部の self のクラスは: #{self.class}"
  end
end
