#!/usr/bin/env ruby
# frozen_string_literal: true

require 'net/http'
require 'json'
 
URL = 'https://api.github.com/emojis'

def clipboard_copy_method_name
  !(/darwin/ =~ RUBY_PLATFORM).nil? ? 'pbcopy' : 'xclip'
end

puts URI(URL)
  .tap { |url| break Net::HTTP.get(url) }
  .tap { |response| break JSON.parse(response).keys }
  .tap { |emojis| break ":#{emojis.sample}:" }
