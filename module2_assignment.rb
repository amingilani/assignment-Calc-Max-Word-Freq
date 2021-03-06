# Implement all parts of this assignment within (this) module2_assignment2.rb
# file

# Implement a class called LineAnalyzer.
class LineAnalyzer
  # Implement the following read-only attributes in the LineAnalyzer class.
  # * highest_wf_count - a number with maximum number of occurrences for
  #   a single word (calculated)
  attr_reader :highest_wf_count
  # * highest_wf_words - an array of words with the maximum number of
  #   occurrences (calculated)
  attr_reader :highest_wf_words
  # * content          - the string analyzed (provided)
  attr_reader :content
  # * line_number      - the line number analyzed (provided)
  attr_reader :line_number

  # Add the following methods in the LineAnalyzer class.
  # * initialize() - taking a line of text (content) and a line number
  def initialize(content, line_number)
    # Implement the initialize() method to:
    # * take in a line of text and line number
    # * initialize the content and line_number attributes
    @content = content
    @line_number = line_number
    # * call the calculate_word_frequency() method.
    calculate_word_frequency
  end

  # * calculate_word_frequency() - calculates result
  def calculate_word_frequency
    # Implement the calculate_word_frequency() method to:
    # * calculate the maximum number of times a single word appears within
    #   provided content and store that in the highest_wf_count attribute.
    wf_count = []
    words_array = @content.downcase.split
    words_array.uniq.each do |word|
      wf_count << [word, words_array.count(word)]
    end
    wf_count = wf_count.sort_by { |wf| wf[1] }.reverse
    @highest_wf_count = wf_count[0][1]
    # * identify the words that were used the maximum number of times and
    #   store that in the highest_wf_words attribute.
    @highest_wf_words = wf_count
                        .select { |wf| wf[1] == @highest_wf_count }
                        .map { |wf| wf[0] }
    puts @highest_wf_count
  end
end

#  Implement a class called Solution.
class Solution
  # Implement the following read-only attributes in the Solution class.
  # * analyzers - an array of LineAnalyzer objects for each line in the file
  attr_reader :analyzers
  # * highest_count_across_lines - a number with the maximum value for
  #   highest_wf_words attribute in the analyzers array.
  attr_reader :highest_count_across_lines
  # * highest_count_words_across_lines - a filtered array of LineAnalyzer
  #   objects with the highest_wf_words attribute
  attr_reader :highest_count_words_across_lines
  #   equal to the highest_count_across_lines determined previously.
  attr_reader :highest_count_words_across_lines

  def initialize
    @analyzers = []
  end

  def analyze_file
    # Implement the following methods in the Solution class.
    # * analyze_file() - processes 'test.txt' intro an array of LineAnalyzers
    #   and stores them in analyzers.
    # Implement the analyze_file() method() to:
    # * Read the 'test.txt' file in lines
    # * Create an array of LineAnalyzers for each line in the file
    f = []
    File.foreach('test.txt') { |a| f << a.chomp }
    f.each_with_index do |v, k|
      @analyzers << LineAnalyzer.new(v, k + 1)
    end
  end

  def calculate_line_with_highest_frequency
    # * calculate_line_with_highest_frequency() - determines the
    #   highest_count_across_lines and
    @highest_count_across_lines = @analyzers
                                  .sort_by(&:highest_wf_count).reverse[0]
                                  .highest_wf_count
    #   highest_count_words_across_lines attribute values
    @highest_count_words_across_lines = @analyzers
                                        .select do |a|
                                          a.highest_wf_count ==
                                            @highest_count_across_lines
                                        end
    # Implement the calculate_line_with_highest_frequency() method to:
    # * calculate the maximum value for highest_wf_count contained by
    #   the LineAnalyzer objects in analyzers array
    #   and stores this result in the highest_count_across_lines attribute.
    # * identifies the LineAnalyzer objects in the analyzers array that
    #   have highest_wf_count equal to highest_count_across_lines
    #   attribute value determined previously and stores them in
    #   highest_count_words_across_lines.
  end

  def print_highest_word_frequency_across_lines
  # * print_highest_word_frequency_across_lines() - prints the values of
  # LineAnalyzer objects in highest_count_words_across_lines in the specified
  # format
  # Implement the print_highest_word_frequency_across_lines() method to
  # * print the values of objects in highest_count_words_across_lines
  #   in the specified format

  print highest_count_words_across_lines
  end
end
