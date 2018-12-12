module ApplicationHelper
  def avatar_url(user)
    if user.image
      "http://graph.facebook.com/#{user.uid}/picture?type=large"
    else
      gravatar = Digest::MD5::hexdigest(user.email).downcase
      url = "http://gravatar.com/avatar/#{gravatar}.png?s=150"
    end
  end

  def stripe_express_path
    "https://connect.stripe.com/express/oauth/authorize?response_type=code&client_id=ca_B1rNBroei2KgxKRUAZKXsWEhMtpA7WjB&scope=read_write"
  end
end
