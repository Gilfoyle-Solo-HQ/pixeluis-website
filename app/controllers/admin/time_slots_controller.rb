class Admin::TimeSlotsController < Admin::BaseController
  before_action :set_time_slot, only: [ :edit, :update, :destroy ]

  def index
    @time_slots = TimeSlot.upcoming.includes(:consultation_topic)
  end

  def new
    @time_slot = TimeSlot.new
    @topics = ConsultationTopic.all
  end

  def create
    @time_slot = TimeSlot.new(time_slot_params)
    if @time_slot.save
      redirect_to admin_time_slots_path, notice: "Time slot created."
    else
      @topics = ConsultationTopic.all
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @topics = ConsultationTopic.all
  end

  def update
    if @time_slot.update(time_slot_params)
      redirect_to admin_time_slots_path, notice: "Time slot updated."
    else
      @topics = ConsultationTopic.all
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @time_slot.destroy
    redirect_to admin_time_slots_path, notice: "Time slot deleted."
  end

  private

  def set_time_slot
    @time_slot = TimeSlot.find(params[:id])
  end

  def time_slot_params
    params.require(:time_slot).permit(:consultation_topic_id, :starts_at, :ends_at, :booked)
  end
end
