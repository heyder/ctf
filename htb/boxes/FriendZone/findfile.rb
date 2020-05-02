#!/usr/bin/env ruby

#require 'net/http'
#require 'uri'
require 'open-uri'
require 'openssl' 
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE


urls_file = ARGV[0]
filename = ARGV[1]


#puts urls_file
#puts filename


File.readlines(urls_file).each do |url|
  begin
    puts open("#{url.chomp}#{filename}").read
  rescue OpenURI::HTTPError => e
    puts e.message
   end
end
