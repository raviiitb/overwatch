# frozen_string_literal: true

class ApiClient
  def initialize(endpoint)
    @endpoint = endpoint
  end

  def call(path, params = {})
    uri = "#{@endpoint}#{path}?#{params.to_h.to_query}"
    cached_response = Rails.cache.read(uri)
    retries = 0
    begin
      if cached_response
        response = HTTParty.get(uri, headers: { 'If-None-Match' => cached_response.headers[:etag] })
        if response.code == 304
          response
        elsif response.code == 200
          Rails.cache.write(uri, response)
          response
        else
          { error: { status: response.code, title: response.message } }
        end
      else
        response = HTTParty.get(uri)
        Rails.cache.write(uri, response)
        response
      end
    rescue SocketError
      retries += 1
      if retries < 3
        retry
      else
        raise
      end
    end
  end
end
