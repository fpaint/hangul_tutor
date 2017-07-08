# HangulTutor
Game for learning korean hangul alphabet. I've not found a trainer I'd like so I made my own. 

## Usage
It shows a random word from korean dictionary and you shold write a transcription. Then you can view a correct answer and analize your mistakes. 

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'korean-string'
gem 'hangul', git: 'https://github.com/aelaa/hangul.git'
gem 'hangul-tutor', git: 'https://github.com/fpaint/hangul_tutor.git'
```

And then execute:
```bash
$ bundle
```

Mount the engine to your routes.rb:
```bash
mount HangulTutor::Engine => "/"
```

## Acknowledgments
* React!
* Gems hangul and korean-string. They made a half. 
* Korean words dictionary from here - https://www.topikguide.com/6000-most-common-korean-words-1. They made other half.
* Beautiful font Jeju Myeongjo.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
