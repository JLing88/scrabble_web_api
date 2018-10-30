class Sentence
  attr_reader :region, :text
  def initialize(sentence_data)
    @region = sentence_data["regions"].first
    @text = sentence_data["text"]
  end
end