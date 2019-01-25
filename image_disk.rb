if ARGV.length < 3
  print 'What is your disk location > '

  disk = gets.chomp

  print 'What would you like to name your new disk? > '

  disk_name = gets.chomp

  print 'What is your new image location > '

  image = gets.chomp
else
  disk = ARGV[0]
  disk_name = ARGV[1]
  image = ARGV[2]
  puts 'Erasing disk...'

  `diskutil eraseDisk ExFat #{disk_name} #{disk}`

  puts 'Unmounting disk'

  `diskutil unmountDisk #{disk}`

  puts 'Imaging disk...'

  `sudo dd if=#{image} of=#{disk}`
end
