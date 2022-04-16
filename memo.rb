require "csv"

puts "---[1](新規でメモを作成) または \n   [2](既存のメモに内容を追加する)を選択し、数字を入力してください---"

memo_type = gets.chomp

if memo_type == "1"
    puts "---作成するメモの名前(拡張子を除く)を入力してください---"
    new_file_title = gets.chomp

    puts "---メモ内容を入力し、入力終了後に[control]+[D]を押してください---"
    new_memo_content = STDIN.read.chomp
    CSV.open("#{new_file_title}.csv","w") do |test|
      test << [new_memo_content]
    end

    puts "\n---『#{new_file_title}』をcsvファイルとして保存しました---"

elsif memo_type == "2" 
    puts "---以下のメモが存在します---"
    Dir.foreach(".") do |item|
        if item == ".DS_Store" or item == "memo.rb" or item == ".git"
        else
            puts "・#{item}"
        end
    end
    
    puts "---内容を追加したいメモを選択し、名前(拡張子を除く)を入力してください---"
    select_file_title = gets.chomp

    puts "---追加内容を入力し、入力終了後に[control]+[D]を押してください---"
    add_memo_content = STDIN.read.chomp
    CSV.open("#{select_file_title}.csv","a") do |test|
        test << [add_memo_content]
    end

    puts "\n---『#{select_file_title}』の内容を更新しました---"
end