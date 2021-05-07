# プレイヤー(自分)に「0~2」を入力させるロジックを書きます。
class Player
  def hand
    # プレイヤーにじゃんけんの手を選択させる文章を表示させます。
    puts "Please enter a number."
    puts "0: Goo, 1: Choki, 2: Par"
    # 変数「input_hand」にプレイヤーの入力値を代入します。
    # ヒント：getsメソッドについて調べてみましょう。
    input_hand = gets.to_i
    # 「input_hand」が「0, 1, 2」のいずれかだと繰り返し処理を終了し、それ以外（アルファベットも含む）だと繰り返し処理を継続します。
    while input_hand < 0 || input_hand > 2 do
      puts "please enter a number between 0 and 2"
      input_hand = gets.to_i
    end
    puts "you have choose #{input_hand}"
    input_hand
    # if 「input_hand」が「0, 1, 2」のいずれかの場合だった場合
      # ヒント：include?メソッドについて調べてみましょう。
        # 「input_hand」をそのまま返す。
        # ヒント：戻り値を返して繰り返し処理を終了させたい場合、「return」を使用します。
      # else それ以外の場合
        # プレイヤーに「0〜2」を入力させる文章を表示させる。
        # puts "0〜2のPlease enter a number."
        # puts "0: Goo, 1: Choki, 2: Par"
        # 変数「input_hand」にプレイヤーの入力値を代入します。
      # end if statement end
    end
  end
# 相手が「0~2」の値をランダムに生成するロジックを書きます。
class Enemy
  def enemy_hand
    random_number = rand (0..2)
    puts "The computer randomly picked #{random_number}"
    random_number
    # Goo、Choki、Parの値をランダムに取得する。
  end
end
# プレイヤー(自分)が入力した「0~2」と、敵がランダムで生成した「0~2」をじゃんけんをさせて、その結果をコンソール上に出力するロジックを書きます。
class Janken
  def pon(player_hand, enemy_hand)
    difference = player_hand.to_i - enemy_hand.to_i
    result = (difference +3)%3
    if result  == 1
      puts "you lose"
    elsif result == 2
      puts " you win"
    else
      puts "it's a draw, let's play again"
      player = Player.new
      enemy = Enemy.new
      janken = Janken.new
      next_game = janken.pon(player.hand, enemy.enemy_hand)
    end
  end
end
player = Player.new
enemy = Enemy.new
janken = Janken.new
next_game = janken.pon(player.hand, enemy.enemy_hand)
