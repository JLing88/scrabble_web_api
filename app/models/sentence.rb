class Sentence
  def initialize(sentence_data)
    @region = sentence_data["regions"]
    @text = sentence_data["text"]
  end
end