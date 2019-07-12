# frozen_string_literal: true

require 'active_model'

class TrainingPlan
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :title, :string, default: false
  attribute :body, :string, default: false
  attribute :time_limit, :integer, default: false
  attribute :levels, array: :string, default: false
  attribute :tags, array: :string, default: false

  validates :title, presence: true
  validates :body, presence: true
  validates :time_limit, presence: true, numericality: true

  def self.imports_from_yaml(yaml_path)
    yaml = YAML.safe_load(ERB.new(File.read('./training_plan.yml')).result(binding))
    yaml.map { |plan| TrainingPlan.new(plan) }
  end

  def self.pickup_plans(plans, options:)
    error_and_exit 'コマンドエラー：難易度を指定してください。' if options[:level].nil?
    error_and_exit 'コマンドエラー：制限時間を指定してください。' if options[:time_limit].nil?

    plans
      .filter { |p| p.time_limit <= options[:time_limit] }
      .filter { |p| p.levels.include?(options[:level]) }

    plans.filter { |p| p.tags.include?(options[:tag]) } if options[:tag].present?
    plans.sample
  end

end
