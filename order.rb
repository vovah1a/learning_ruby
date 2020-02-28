class Order
  attr_reader :items, :placed_at, :time_spent_on_sending_email

  include ItemContainer

  def initialize
    @items = Array.new
  end

  def place
    @placed_at = Time.now
    thr= Thread.new do
      Pony.mail(
                  :to   => StoreApplication::Admin.email,
                  :from => 'My Order',
                  :via  => :smtp,
                  :via_options => {
                      :address              => 'smtp.gmail.com',
                      :port                 => '587',
                      :enable_starttls_auto => true,
                      :user_name            => 'vovah1a@gmail.com',
                      :password             => '********',
                      :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
                      :domain               => "mail.google.com" # the HELO domain provided by the client to the server
                  },
                  subject: "New Order has been placed",
                  body: "Please check back you admin page to see it!!!"
              )
    end
    sent_email_at = Time.now
    @time_spent_on_sending_email = sent_email_at - @placed_at
  end

end