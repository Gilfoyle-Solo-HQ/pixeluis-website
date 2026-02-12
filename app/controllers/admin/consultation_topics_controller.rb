class Admin::ConsultationTopicsController < Admin::BaseController
  before_action :set_topic, only: [ :show, :edit, :update, :destroy ]

  def index
    @topics = ConsultationTopic.all
  end

  def show
  end

  def new
    @topic = ConsultationTopic.new
  end

  def create
    @topic = ConsultationTopic.new(topic_params)
    if @topic.save
      redirect_to admin_consultation_topic_path(@topic), notice: "Topic created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @topic.update(topic_params)
      redirect_to admin_consultation_topic_path(@topic), notice: "Topic updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @topic.destroy
    redirect_to admin_consultation_topics_path, notice: "Topic deleted."
  end

  private

  def set_topic
    @topic = ConsultationTopic.find(params[:id])
  end

  def topic_params
    params.require(:consultation_topic).permit(:name, :description, :price_cents, :duration_minutes)
  end
end
