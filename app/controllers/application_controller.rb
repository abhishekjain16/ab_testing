class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # before_filter :render_variations, :unless => lambda {|c| c.controller_name == "experiments" || c.controller_name == "variations"}
  before_filter :fetch_experiments, :unless => lambda {|c| c.restricted_to_experiment? }

  # def render_variations
  #   experiment = Experiment.where(:relative_path => request.path).first
  #   if experiment && (variation = experiment.variations.sample)
  #     variation.increment!(:render_count)
  #     render 'shared/xyz' and return if (@html_data = variation.data)
  #   end
  # end

  def fetch_experiments
    @experiments_with_variation = Experiment.with_variations.where(:relative_path => request.path)
  end

  def restricted_to_experiment?
    controller_name == "experiments" || controller_name == "variations" || params[:no_show].present?
  end
end
