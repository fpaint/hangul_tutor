class @HangulTutor extends React.Component
  constructor: (props)->
    super(props)  
    this.state = 
      word: this.props.word
      transcription: ''
      answer: false
    this.getVoice()
  getVoice: ->
    self = this
    window.speechSynthesis.onvoiceschanged = ->
      speechSynthesis.getVoices().forEach (item)-> 
        self.voice = item if(item.lang == 'ko-KR')
  chars: ->
    print_char = (char, i)-> `<li key={i}>{char[0]} &ndash; {char[1]}</li>`
    `<div className='chars_help'>
      <ul>{this.state.word.chars.map(print_char)}</ul>
     </div>`
  form: ->
    `<div className='form'>
      <label>write a transcription:</label>
      <input type='text' onChange={this.onChange.bind(this)} value={this.state.transcription} />
      <button type='button' onClick={this.submit.bind(this)}>OK</button>
     </div>`
  answer: ->
    return '' unless this.state.answer
    `<div className='answer'>
      Transcription: <em>{this.state.word.transcription}</em>
      <div className='link' onClick={this.new_word.bind(this)}>Try next word</div>
     </div>`
  onChange: (e)-> 
    this.setState(transcription: e.target.value)
  submit: ->
    this.setState(answer: true)    
  new_word: ->
    self = this
    $.get '/word', (res)->
      self.setState(word: res, transcription: '', answer: false)
  speak: ->
    word = this.state.word.word
    window.speechSynthesis.cancel();
    msg = new SpeechSynthesisUtterance();
    msg.lang = '';
    msg.text = word;
    msg.voice = this.voice;
    msg.pitch = 1;
    msg.rate = 1;
    window.speechSynthesis.speak(msg);
  render: ->
    `<div className='hangul_tutor'>
       {this.chars()}
       <div className='word' onClick={this.speak.bind(this)}>{this.state.word.word}</div>
       <div className='translation'>{this.state.word.translation}</div>       
       {this.form()}
       {this.answer()}
     </div>`