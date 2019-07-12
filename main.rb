# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'
require 'colorize'
require 'optparse'
require 'yaml'
require 'erb'
require 'active_support/all'
require './utilities'
require './training_plan'
require './plan_renderer'
require './command_parser'

# training_plan.yml から条件にあったトレーニングプランを提示します。
# ターミナル上で難易度と時間を指定して呼び出すと、マッチしたトレーニングから1つ選びます。
def main
  # Load training plans
  plans = TrainingPlan.imports_from_yaml './training_plan.yml'

  # Pickup a training plan
  plan = TrainingPlan.pickup_plans(plans,
                                   options: CommandParser.new(ARGV).options)

  # Render a training plan
  PlanRenderer.new.render plan
end

main
