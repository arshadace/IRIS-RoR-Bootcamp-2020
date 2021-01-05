# The function `lower_case` takes an array of strings and converts
# any non-lower case alphabet (A..Z) to corresponding lower case
# alphabet
def lower_case(words)
    
  return words.map {|w| w.downcase}
end

# Similar to `lower_case`, this function modifies the array in-place
# and does not return any value.
def lower_case!(words)
  
  puts words.map! {|w| w.downcase}
  return nil
end

# Given a prefix and an array of words, return an array containing
# words that have same prefix.
#
# For example:
# words_with_prefix('apple', ['apple', 'ball', 'applesauce']) would
# return the words 'apple' and 'applesauce'.
def words_with_prefix(prefix, words)
  return words.select {|w| w.start_with?prefix}
  
end

# The similarity score between two words is defined as the length of
# largest common prefix between the words.
#
# For example:
# - Similarity of (bike, bite) is 2 as 'bi' is the largest common prefix.
# - Similarity of (apple, bite) is 0 as there are no common letters in
#   the prefix
# - similarity of (applesauce, apple) is 5 as 'apple' is the largest
#   common prefix.
# 
# The function `similarity_score` takes two words and returns the
# similarity score (an integer).
def similarity_score(word_1, word_2)
  d=0
  for i in 1..(word_1.length<word_2.length ? word_1.length: word_2.length)
    if (word_1[i-1]==word_2[i-1])
      d=d+1  
    else
      break
    end
  end  
    return d
end

# Given a chosen word and an array of words, return an array of word(s)
# with the maximum similarity score in the order they appear.

def most_similar_words(chosen_word, words)
  d=[]
  s=[]
  for i in 1..words.length
    s.append(similarity_score(words[i-1],chosen_word))
  end
  max=s.max()
  for i in 1..words.length
    if s[i-1]==max
      d.append(words[i-1])
    end
  end
  return d
end
