# Analyze some text! (This program is based heavily on ch. 4 of Peter Cooper's "Beginning Ruby")

stopwords = %w{the a by on for of are with just but and to the my I has some in}
#lines = File.readlines("text.txt")
lines = File.readlines(ARGV[0])
line_count = lines.size
text = lines.join

total_characters = text.length
total_characters_nospaces = text.gsub(/|s+/, '').length

total_words = text.split.length
total_words2 = text.scan(/\w+/).size
sentence_count = text.split(/\.|\?|!/).length
paragraph_count = text.split(/\n\n/).length

# lists all words that aren't stopwords, counts them, and works out percentage of non-stopwords
all_words = text.scan(/\w+/)
good_words = all_words.select{ |word| !stopwords.include?(word) }
good_percentage = ((good_words.length.to_f / all_words.length.to_f) * 100).to_i

#summarizes text by picking out average length sentences that include nouns
sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)
sentences_sorted = sentences.sort_by { |sentence| sentence.length }
one_third = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/ }

# hands the user a convenient package of data
puts "Here, have some handy statistics for this text:"
puts "#{line_count} lines"
puts "#{total_characters} characters"
puts"#{total_characters_nospaces} characters, excludng spaces. Because we can't all be astronauts, BRO."
puts "#{total_words} words separated by a space. (Hyphenated words get to stick together! Yay!)"
puts "#{total_words2} words separated by anything at all. (Ignore this. I'm just being fancy.)"
puts "#{sentence_count} sentences ended by periods and exclamation/question marks."
puts "#{paragraph_count} paragraphs."
puts "#{sentence_count / paragraph_count} sentances per paragraph, on average."
puts "#{total_words / sentence_count} words per sentence, on average."
puts "#{good_percentage}% of words are non-fluff words."
puts "Summary:\n\n" + ideal_sentences.join(". ")
puts "-- End of analysis"


