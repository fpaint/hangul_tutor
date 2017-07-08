# desc "Explaining what the task does"
# task :hangul_tutor do
#   # Task goes here
# end

require 'nokogiri'
require 'open-uri'
require 'sqlite3'

namespace :hangul_tutor do

  def load_dict(url) 
    doc = Nokogiri::HTML(open(url))
    data = []
    doc.css('.entry-content table tr').each do |row|
      data << [
        row.css('td')[0].text.strip.to_i,
        row.css('td')[1].text.gsub(/^[[:space:]]/,'').strip,
        row.css('td')[2].text.gsub(/^[[:space:]]/,'').strip
      ]
    end
    data
  end

  def create_db
    db = SQLite3::Database.new "db/dict.db"
    db.execute_batch <<-SQL
      drop table if exists words;
      create table words (
        num integer,
        word text,
        translation text
      );
SQL
    db
  end

  def save_data(db, data)
    db.transaction do |t|
      data.each do |row|
        t.execute "insert into words (num, word, translation) values (?, ?, ?);", row
      end
    end
  end

  task dict: :environment do
    db = create_db
    (1..6).each do |i|
      url = "https://www.topikguide.com/6000-most-common-korean-words-#{i}/"
      data = load_dict url
      save_data db, data
    end
  end

  task test_dict: :environment do
    require 'hangul'
    HangulTutor::Word.all.each do |w|
      begin
        Hangul::Hangul.to_roman(w.word)
      rescue => e
        print "'#{w.word}'", ' - ', w.word.split_ko, ' - ', e.message, $/  
      end
    end
  end  

end