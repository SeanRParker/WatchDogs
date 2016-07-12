class QuizzesController < ApplicationController

  def results
    @options = Quiz.set_options(params)
    @options[:count] = 1
    @dogs = {}

    
    # file = File.read(Rails.root.join('lib/breeds.json'))
    # breeds = JSON.parse(file)['data']
    # binding.pry

    # breeds.select {|b| b['energy'] == @options['energy']}
    # breeds.select {|b| b['apartment'] == @options['s']}


    # results = Quiz.search("#{params[:zip]}", @options)
    # @spaniel == results.select {|dog| dog.breeds.include?('spaniel') }

    if @options[:size] == 'S'
      @dogs[:spaniel] = Quiz.search("#{params[:zip]}", @options.merge({breed: 'english springer spaniel'}))
      @dogs[:maltese] = Quiz.search("#{params[:zip]}", @options.merge({breed: 'maltese'}))
      @dogs[:shih_tzu] = Quiz.search("#{params[:zip]}", @options.merge({breed: 'shih tzu'}))
    end

    if @options[:size] == 'L'
      @dogs[:beagle] = Quiz.search("#{params[:zip]}", @options.merge({breed: 'beagle'}))
      @dogs[:spaniel] = Quiz.search("#{params[:zip]}", @options.merge({breed: 'english springer spaniel'}))
      @dogs[:maltese] = Quiz.search("#{params[:zip]}", @options.merge({breed: 'maltese'}))
      @dogs[:shih_tzu] = Quiz.search("#{params[:zip]}", @options.merge({breed: 'shih tzu'}))
      @dogs[:lab] = Quiz.search("#{params[:zip]}", @options.merge({breed: 'labrador retriever'}))
      @dogs[:golden] = Quiz.search("#{params[:zip]}", @options.merge({breed: 'golden retriever'}))
      @dogs[:bloodhound] = Quiz.search("#{params[:zip]}", @options.merge({breed: 'bloodhound'}))
    end
    # binding.pry
  end
    





  def form
    @params = params
    redirect_to results_path(params: @params)
  end  

  # CUSTOM QUESTIONS ROUTES 

  def question_1

  end

  
  private


  # def show
  #   @result = Dog.search("84102",{breed: "Labrador Retriever", age: "Young"})
  # end
  
end

