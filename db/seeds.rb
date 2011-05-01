# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

m = File.open("words_seed.txt","r")
  #m = File.open("/home/tomay/Desktop/DESKTOP/Bells/2011/test.html","r")
  lines = m.readlines
  puts "ok-"
  body = []
  #@p = Post.new
  lines.each {|line|
    if line[0..4] == "=~=~="
      title1 = line.sub("=~=~=","")
      @title = title1.sub("=~=~=","")
      #puts "Title: " + title
      #@p.title = title
    else
      body << line unless line[0..6] == "%%end%%"
      if line[0..6] == "%%end%%"
        #puts "Body: " + body.join("")
        #@p.text = body
        Post.create(:title => @title.strip, :content => body.join(""))
        puts "Created: " + @title.strip
        body = []
        next
      end
    end
  }
