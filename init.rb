require_relative "store_application"
StoreApplication.config do |app|

  app.name = "My Store"
  app.environment = :production

  app.admin do |admin|
    admin.email = "vovah1a@gmail.com"
    admin.login = "admin"
    admin.send_info_emails_on :mondays
  end

end

@items = []
@items << AntiqueItem.new("car", price: 101, weight: 100)
@items << RealItem.new({:price => 101, :weight => 100, :name => "kettle"})
@items << RealItem.new({:price => 101, :weight => 100, :name => "dishwasher"})

order = Order.new
order.place
puts order.placed_at.strftime("%b %-d, %Y %H:%M:%S") # M D, Y  T

 #order = Order.new
 #@items.each {|i| order.add_item(i)}
 #order.place