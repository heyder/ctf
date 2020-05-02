require 'net/http'
require 'uri'
require 'readline'
require 'cgi'


class Fortune
  attr_accessor :uri
  def initialize()
    @uri = URI.parse 'http://10.10.10.127/select'
  end
  def runcmd(cmd)
    http = Net::HTTP.new(@uri.host, @uri.port)
    request = Net::HTTP::Post.new(@uri.request_uri)
    body = 'db=_fortunes'
    request.body = URI.encode("#{body}; #{cmd}")
    response = http.request(request)
    response.body.match(%r{.+<pre>(.*)</pre>}m)
    if $1
      return CGI.unescapeHTML($1.strip)
    else
      puts response.body
      return "empty"
    end
  end
end


fortune = Fortune.new()

prompt = "\n> "
#print prompt
=begin
while user_input = gets.chomp # loop while getting user input
  if user_input
    puts fortune.runcmd(user_input)
    #break # and again
    print prompt # print the prompt, so the user knows to re-enter input
  else
    print prompt # print the prompt, so the user knows to re-enter input
  end
end
=end
while user_input = Readline.readline(prompt, true)
  if user_input
    print fortune.runcmd(user_input)
  end
end


