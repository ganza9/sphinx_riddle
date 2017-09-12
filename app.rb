require ('sinatra')
require ('sinatra/reloader')
also_reload('lib/**/*.rb')
require ('./lib/sphinx')
require ('pry')

COUNT = 0
ARRAY = []
SUCCESS_COUNT = 0
get ('/') do
  riddle_obj = Sphinx.new(false)
  random_no = riddle_obj.random_no
  ARRAY = []
  ARRAY.push(random_no)
  SUCCESS_COUNT = 0
  COUNT= 0
  @riddle = riddle_obj.random_riddles_question(random_no)
  erb(:input)
end

post ('/output') do
  @input_answer = params.fetch('answer')
  @question = params.fetch('question')
  riddle_obj = Sphinx.new(false)

  random_no = riddle_obj.riddles_hash_question.key(@question)
  @answer = riddle_obj.riddles_hash_answer[random_no]
  if @input_answer.downcase == @answer
    # erb(:success)
    SUCCESS_COUNT += 1
    COUNT = 0
    if SUCCESS_COUNT < 5
      @correct_answer = "correct answer : " +SUCCESS_COUNT.to_s
      random_no = riddle_obj.random_no
      while ARRAY.include?(random_no)
        random_no = riddle_obj.random_no
      end
      ARRAY.push(random_no)
      @riddle = riddle_obj.random_riddles_question(random_no)
      erb(:input)
    elsif SUCCESS_COUNT == 5
      erb(:success)
    end
  else
    COUNT += 1
    if COUNT > 2
      erb(:fail)
    else
        @chance = "You have total 3 chance in which you used " +COUNT.to_s + " chance"
        @clue = riddle_obj.riddles_hash_clue[random_no]
        @clue = "*Clue: " + @clue
        @riddle = riddle_obj.random_riddles_question(random_no)
        erb(:input)

    end
  end
end
