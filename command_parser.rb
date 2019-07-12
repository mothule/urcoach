# frozen_string_literal: true

class CommandParser
  attr_accessor :options

  def initialize(argv)
    @options = {
      level: nil,
      time_limit: nil,
      tag: nil
    }

    parse argv
  end

  private

  def parse(argv)
    OptionParser.new do |parser|
      # options
      parser.on('-l LEVEL', '--level LEVEL', '難易度を指定. beginner, normal or hard') { |v| options[:level] = v }
      parser.on('-t MINUTE', '--time MINUTE', '制限時間を分指定. .e.g. 10') { |v| options[:time_limit] = v.to_i.minutes }
      parser.on('-ta MINUTE', '--tag TAG', 'タグを指定. .e.g. rails') { |v| options[:tag] = v }
      parser.parse!(argv)
    end

  end
end
