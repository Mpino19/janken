
puts "最初はグー、じゃんけん、、、"

def janken
  puts "何を出しますか"
  puts "[0]グー、[1]チョキ、[2]パー、[3]戦わない"
  player_hand = gets.to_i
  cpu_hand = rand(3)
  jankens = ["グー","チョキ","パー"]
  if player_hand > 3
    puts "0~3を入力してください"
    janken
  elsif player_hand == 3
    puts "ジャンケンを終了します"
    exit
  end
  puts "ほい！"
  puts "あなたは#{jankens[player_hand]}を出しました"
  puts "相手は#{jankens[cpu_hand]}を出しました"
  if player_hand == cpu_hand
    puts "あいこで、、、"
    janken
  elsif (player_hand == 0 && cpu_hand == 1) || (player_hand == 1 && cpu_hand == 2) || (player_hand == 2 && cpu_hand == 0)
    puts "ジャンケンに勝ちました"
    @janken_result = "win"
    acchimuite_hoi
  else
    puts "ジャンケンに負けました"
    @janken_result = "lose"
    acchimuite_hoi
  end
end

def acchimuite_hoi
  puts "あっちむいて、、、"
  puts "[0]上、[1]右、[2]下、[3]左、[4]やめる"
  player_dir = gets.to_i
  cpu_dir = rand(4)
  directions = ["上","右","下","左"]
  if player_dir > 4
    puts "0~4を入力してください"
    acchimuite_hoi
  elsif player_dir == 4
    puts "あっちむいてほいを終了します"
    exit
  end
  puts "ほい！"
  case @janken_result
  when "win"
    puts "あなた:#{directions[player_dir]}を指しました"
    puts "相手:#{directions[cpu_dir]}を向きました"
  when "lose"
    puts "あなた:#{directions[player_dir]}を向きました"
    puts "相手:#{directions[cpu_dir]}を指しました"
  end
  if (player_dir == cpu_dir) && (@janken_result == "win")
    puts "あなたの勝ちです"
    exit
  elsif (player_dir == cpu_dir) && (@janken_result == "lose")
    puts "あなたの負けです"
    exit
  end
  puts "じゃんけん、、、"
  janken
end

while true
  janken
end
