require "open-uri"
require "json"

class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ('A'..'Z').to_a.sample }
    @letters
  end

  def score
    letters_list = params[:letters_list].downcase.split(' ')
    guess = params[:guess]
    guess_array = guess.downcase.split('')
    # raise

    url = "https://wagon-dictionary.herokuapp.com/#{guess}"
    results = JSON.parse(URI.open(url).read)
    # raise
    # @guess = params[:guess]

    if guess_array.all? { |letter| letters_list.include? letter } && results['found']
      @game_result = "you get a cookie"
    elsif guess_array.all? { |letter| letters_list.include? letter } && results['found'] == false
      @game_result = "you don't get a cookie"
    else
      @game_result = "we take a cookie"
    end
    # if letters are in letters
    #   bravo

  end
end
