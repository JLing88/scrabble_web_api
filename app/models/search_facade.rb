class SearchFacade 
  def initialize(word)
    @word = word
  end

  def sentences
    @sentences ||= service.users_search.map do |data|
      User.new(data)
    end
  end

  private

  def service(word)
    OxfordService.new(word)
  end
end