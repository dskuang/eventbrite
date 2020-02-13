class BaseWorker
  include Sidekiq::Worker
  attr_reader :options

  def perform(*args)
    @options = OpenStruct.new(args.extract_options!)

    pre_perform!
    perform!
    post_perform!
  end

  private

  def pre_perform!; end

  def perform!; end

  def post_perform!; end
end