class LinesController < ApplicationController
  def index
    @lines = Line.all
  end

  def new
    @line = Line.new
  end

  def create
    Line.create(line_params)
    if @line.invalid?
      flash[:error] = '<strong>Could not save</strong> please make sure all fields are filled out.'
    end
    redirect_to root_path
  end

  private

  def line_params
    params.require(:line).permit(:message, :name)
  end

end
