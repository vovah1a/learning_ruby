class Duck

  @@greeting = "Hello"

  def initialize (greeting)
    @greeting = greeting
  end

  def quack
    puts "#{@@greeting} #{@greeting}"
  end

  class << self

    attr_accessor :greeting

    def quack
      puts "#{@@greeting} #{@greeting}"
    end

  end

end


duck1=Duck.new("quack quack")
duck1.quack

Duck.greeting = "class quack"
Duck.quack