#!/usr/bin/env ruby
require 'mechanize'
require 'rubygems'
require 'active_support/all'

class Beer
    attr_accessor :name, :abv

    def initialize(name, abv)
        @name = name
        @abv = abv
    end
end

module Frisco
    def self.beers
        spider = Mechanize.new { |agent|
            agent.user_agent_alias = 'Windows Mozilla'
        }

        beers = []
        abvs = []
        page = spider.get('http://www.friscogrille.com/cmobile-alt.php')
        
        page.search('.row > .sixteenounce > .name').each do |beer|
            beers << beer.text
        end
        
        page.search('.row > .sixteenounce > .abv').each do |abv|
            abvs << abv.text
        end

        page.search('.row > .tenounce > .name').each do |beer|
            beers << beer.text
        end

        page.search('.row > .tenounce > .abv').each do |abv|
            abvs << abv.text
        end

        page.search('.row > .eightounce > .name').each do |beer|
            beers << beer.text
        end
        
        page.search('.row > .eightounce > .abv').each do |abv|
            abvs << abv.text
        end

        beers_list = Array.new
        
        beers.each_with_index do |beer, index|
            b = Beer.new(beer, abvs[index])
            beers_list << b
        end

        puts beers_list.to_json
    end
end

# print HTTP headers manually. Can add encoding to end of content-type if needed

puts "HTTP/1.0 200 OK"
puts "Content-type: text/html\n\n"


Frisco.beers
