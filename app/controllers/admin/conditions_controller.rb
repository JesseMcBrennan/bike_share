class Admin::ConditionsController < Admin::BaseController

  def new
    @condition = Condition.new
  end

  def create
    @condition = Condition.new(condition_params)
    if @condition.save
      flash[:successs] = "Weather condition for #{@condition.date} created."
      redirect_to condition_path(@condition)
    else
      flash[:alert] = "Missing required fields, condition was not created."
      render :new
    end
  end

  def edit
    @condition = Condition.find(params[:id])
  end

  def update
    @condition = Condition.find(params[:id])
    @condition.update(condition_params)
    if @condition.save
      flash[:successs] = "Weather condition for #{@condition.date} updated."
      redirect_to condition_path(@condition)
    else
      render :edit
    end
  end

  def destroy
    condition = Condition.destroy(params[:id])
    flash[:success] = "Successfully deleted condition #{condition.date}"
    redirect_to conditions_path
  end

  private

  def condition_params
    params.require(:condition).permit(:date,
                                      :max_temp,
                                      :mean_temp,
                                      :min_temp,
                                      :mean_humidity,
                                      :mean_visibility,
                                      :mean_wind_speed,
                                      :precipitation)
  end
end
