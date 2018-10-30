class SentencesFacade 
  def initialize(word)
    @word = word
  end

  def word
    @word
  end

  def sentences 
    service.get_json("entries/en/#{@word}/sentences")[:results].first[:lexicalEntries].first[:sentences].map do |sentence|
      if sentence[:regions].include?("British") || sentence[:regions].include?("Canadian")
        Sentence.new(sentence)
      end
    end.compact
  end

  private

  def service
    OxfordService.new
  end
end