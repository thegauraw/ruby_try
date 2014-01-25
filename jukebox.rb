class Jukebox
	attr_accessor :playlist, :current

	def initialize(pos=0)
		@current = pos
		@playlist = ['song1','song2','song3','song4','song5','song6','song7','song8','song9','song10']
	end

	def next_track
		if @current == @playlist.length - 1
			@current = 0
		else
			@current += 1
		end
	end

	def prev_track
		if @current == 0
			@current = @playlist.length - 1
		else
			@current -= 1
		end
	end

	def add_track(track)
		@playlist.push(track)
		puts "New Song Added: -- '#{track}'"
	end

	# def remove_track(track)
	# 	puts "Song Removed: -- '#{track}'"
	# 	@playlist[track-1,1] = []
	# end

	def info
		20.times { print "*" }
		puts "\nNow Playing: " + @playlist[@current]
		20.times { print "*" }
	end

	def play_track(pos=0)
		@current = pos
	end

	def check_pos?(pos)
		if pos > playlist.length
			print "Sorry we have only #{playlist.length} songs\n\nEnter 0 to quit. \n\n"

		else
			true
		end
	end

	def show
		puts "List of Songs Available"
		@playlist.each_with_index { |song, index| puts "#{index+1} #{song}"}
	end

	def suffle
		@current = (0..@playlist.length-1).to_a.sample
	end


end




if __FILE__ == $0

	mychoice = 5
	juke = Jukebox.new

	while mychoice != 0

		puts "\n\n\nMENU"
		20.times{ print "#" }
		puts "\n0. Exit"
		puts "1. Current Song"
		puts "2. Next Track"
		puts "3. Prev Track"
		puts "4. Select Track by Number"
		puts "5. Show Tracks"
		puts "6. Add Track"
		puts "7. Suffle Track"

		20.times{ print "#" }
		print "\n\nMake your choice:  "
		mychoice = gets.chomp.to_i

		case mychoice
		when 0
			break
		when 1
		 	juke.info
		when 2
			juke.next_track
			juke.info
		when 3
			juke.prev_track
		  	juke.info
		when 4
			puts "Enter your fav. track number: "
			num = gets.chomp.to_i
			if juke.check_pos?(num)
				juke.play_track(num-1)
				juke.info
			end
		when 5
			juke.show
			juke.info
		when 6
			print "\nEnter New Track: "
			track = gets.chomp
			juke.add_track(track)
		when 7
			juke.suffle
			juke.info
		else
		  	puts "You gave me #{mychoice} -- I have no idea what to do with that."
		  	juke.info
		end
	end
end
