class Cart
  attr_reader :items

  include ItemContainer
  class ItemNoSupported < StandardError; end

  UNSUPPORTED_ITEMS = [AntiqueItem, VirtualItem]

  def initialize (owner)
    @items = Array.new
    @owner = owner
  end

  def save_to_file
    File.open("#{@owner}_cart.txt", "w") do |f|
      @items.each do |i|
        raise ItemNoSupported if UNSUPPORTED_ITEMS.include?(i.class)
        i.puts i
      end

    end
  end

  def read_from_file
    begin
      File.readlines("#{@owner}_cart.txt").each {|i| @items << i.to_real_item}
      @items.uniq!
    rescue Errno::ENOENT
      File.open("#{@owner}_cart.txt", "w") {}
      puts "File #{@owner}_cart.txt created"
    end
  end
end
