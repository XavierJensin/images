require './image_array.rb'

puts "What is the name of the file that you want to edit"
imagefile = gets.to_s.chomp
img = ImageArray.new(imagefile)

puts "What effect would you like to apply to your image? (inv, bw, tint, noise)"

option= gets.chomp

#Make the image inverse
if option == "inv"
	puts "The program is inverting your image, this may take a while depending on the size of the image. Please do not type anything while it is running."
	
	img.each do |row|
		row.each do |pixel|
			red_inverse = img.max_intensity - pixel.red
			blue_inverse = img.max_intensity - pixel.blue
			green_inverse = img.max_intensity - pixel. green
			pixel.red = red_inverse
			pixel.blue = blue_inverse
			pixel.green = green_inverse
		end
	end
end

if option == "bw"
puts "The program is making your image Black and White, this may take a while depending on the size of the image. Please do not type anything while it is running."
	img.each do |row|
		row.each do |pixel|
			pixel_gray = (pixel.red + pixel.blue + pixel.green)/3
			pixel.red = pixel_gray
			pixel.green = pixel_gray
			pixel.blue = pixel_gray
		end
	end
end

if option == "tint"
	puts "What color would you like to tint the image? ('blue' 'red' or 'green')"
	tint_option = gets.to_s.chomp
	puts "What percent of the other colors would you like there to be?"
	percent = gets.to_f
	if tint_option == "blue"
	puts "The program is tinting your image blue, this may take a while depending on the size of the image. Please do not type anything while it is running"

		img.each do |row|
			row.each do |pixel|
				red_tint = pixel.red * (percent/100)
				pixel.red = red_tint
				green_tint = pixel.green * (percent/100)
				pixel.green = green_tint
				
			end
		end
	end
		
	if tint_option == "green"
	puts "The program is tinting your image green, this may take a while depending on the size of the image. Please do not type anything while it is running."
		img.each do |row|
			row.each do |pixel|
				red_tint = pixel.red * (percent/100)
				pixel.red = red_tint
				blue_tint = pixel.blue * (percent/100)
				pixel.blue = blue_tint
				
			end
		end
	end

	if tint_option == "red"
	puts "The program is tinting your image red, this may take a while depending on the size of the image. Please do not type anything while it is running."
		img.each do |row|
			row.each do |pixel|
				green_tint = pixel.green * (percent/100)
				pixel.green = green_tint
				blue_tint = pixel.blue * (percent/100)
				pixel.blue = blue_tint
				
			end
		end
	end
end
if option == "noise"
puts "The program is making your image have random noise, this may take a while depending on the size of the image. Please do not type anything while it is running."
	img.each do |row|
		row.each do |pixel|
			pixel.red = rand(pixel.red)
			pixel.green = rand(pixel.green)
			pixel.blue = rand(pixel.blue)
		end
	end
end
img.write("./Edited_File.jpg")

puts "The program is done applying the change to your photo!"
#Make the image tinted either red blue or green

