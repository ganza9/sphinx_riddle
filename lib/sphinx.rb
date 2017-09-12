class Sphinx
  attr_accessor :riddles_hash_question, :riddles_hash_answer, :riddles_hash_clue
  def initialize(count)
    @riddles_hash_question = {
      1 =>"Close to the words of life stay I but I wither wane and grow dry",
      2 =>"Always wax yet always wane: I melt succumbed to the flame. Lighting darkness with fate unblest I soon devolve to shapeless mess",
      3 =>"To you rude would I never be though I flag my tongue for all to see",
      4 =>"Here there is no north west nor east and weather fit for not man nor beast",
      5 =>"Large as a mountain small as a pea endlessly swimming in a waterless sea"
    }
    @riddles_hash_answer = {
      1 =>"flower",
      2 =>"candle",
      3 =>"dog",
      4 => "north pole",
      5 => 'asteroids'
    }
    @riddles_hash_clue = {
      1 =>"Type of plant",
      2 =>"I burn",
      3 =>"Man's best friend",
      4 => "Santa",
      5 => "Space Rock"
    }

  end

  def random_no
    random = Random.new
    random.rand(1..5)
  end

  def random_riddles_question(no)
    @riddles_hash_question[no]
  end

  # def random_riddles_answer
  #   # @riddles_hash_answer[@random_no]
  # end

end
