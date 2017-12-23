require 'state_machine'

class FeelState 
  state_machine :status, initial: :平常 do
    # 心の状態
    state :平常
    state :おこ
    state :まじおこ
    state :激おこ

    # 心の状態を変化させるイベント
    event :既読スルー do
      transition \
        :平常 => :おこ,
        :おこ => :まじおこ,
        :まじおこ => :激おこ
    end

    event :すっぽかし do
      transition \
        :平常 => :まじおこ,
        [:おこ, :まじおこ] => :激おこ
    end

    event :喧嘩 do
      transition all, :まじおこ
    end
    
    event :浮気 do
      transition all, :激おこ
    end

    event :褒める do
      # 怒ってるときに褒めても何も起こらない
    end

    event :謝る do
      transition \
        :おこ => :平常,
        :まじおこ => おこ
      # 「激おこ」は、謝ったぐらいでは収まらない
    end
    
    event :土下座 do
      transition \
        :おこ => :まじおこ,
        :まじおこ => :おこ,
        :激おこ => :まじおこ
      # 「おこ」ぐらいで土下座はやり過ぎで逆効果
    end
    
    event :プレゼント do
      # 池澤さんが適当にかえてください
      transition \
        :おこ => :平常,
        :まじおこ => :平常,
        :激おこ => :まじおこ
    end
end
