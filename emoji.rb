#!/usr/bin/env ruby
# frozen_string_literal: true

require 'net/http'
require 'json'
 
URL = URI.parse('https://api.github.com/emojis')


puts URI(URL)
  .tap { |url| Net::HTTP.get(url) }
  .tap { |response| JSON.parse(response).keys }
  .tap { |emojis| ":#{emojis.sample}:" }
  .tap { |text| IO.popen('xclip', '-selection clipboard') { |f| f << text } }
