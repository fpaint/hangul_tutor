require 'hangul'

module HangulTutor
  class Word < ApplicationRecord
    establish_connection :adapter => 'sqlite3', :database => 'db/dict.db'
    self.table_name = 'words'

    def self.get_random     
      offset = rand(Word.count)
      Word.offset(offset).first
    end

    def json
      str = word.gsub(/^[[:space:]]/,'')
      {
        num: num,
        word: str,
        translation: translation,
        transcription: str.to_roman,
        chars: chars
      }
    end

    def chars
      table = Hangul::Hangul::HANGUL_TABLE
      arr = word.split_ko

      arr.flatten.uniq.map do |char|
        if table.include? char
          if table[char].class == Array
            tr = table[char].uniq.reject{|c| c.empty?}.join(',')
          else
            tr = table[char]
          end
        end
        [char, tr]
      end
    end
  end
end
