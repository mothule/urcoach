# frozen_string_literal: true

class PlanRenderer
  attr_accessor :width,
                :color

  def initialize
    @width = 150
    @color = :light_yellow
  end

  def render(plan)
    puts separate '='
    puts make_title_line plan
    puts separate '-'
    puts ' ' + plan.body.gsub(/\n/, "\n ").colorize(color)
    puts separate '='
  end

  private

  def make_title_line(plan)
    title = ' ' + plan.title
    time_limit = "制限時間:#{Time.at(plan.time_limit).strftime('%M').to_i}分"
    spaces = ' ' * (width - title.length_contains_non_ascii - time_limit.length_contains_non_ascii)
    "#{title}#{spaces}#{time_limit}".colorize(color)
  end

  def separate(part = '=')
    part.colorize(color) * width
  end
end
