module RequestHelpers
  def js_accept_headers
    format = Mime::JS.to_s

    request.headers['Accept'] = format
    request.headers['Content-Type'] = format
  end
end

RSpec.configure do |config|
  config.include RequestHelpers, type: :controller
end
