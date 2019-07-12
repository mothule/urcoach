# frozen_string_literal: true

def error_and_exit(message, exit_code = 1)
  puts message.colorize(:light_red)
  exit exit_code
end


class String
  def length_contains_non_ascii
    chars.reject(&:ascii_only?).length * 2 +
      chars.select(&:ascii_only?).length
  end
end
