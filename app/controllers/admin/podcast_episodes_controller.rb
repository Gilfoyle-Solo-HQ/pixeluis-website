class Admin::PodcastEpisodesController < Admin::BaseController
  before_action :set_episode, only: [ :show, :edit, :update, :destroy ]

  def index
    @episodes = PodcastEpisode.recent
  end

  def show
  end

  def new
    @episode = PodcastEpisode.new
  end

  def create
    @episode = PodcastEpisode.new(episode_params)
    if @episode.save
      redirect_to admin_podcast_episode_path(@episode), notice: "Episode created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @episode.update(episode_params)
      redirect_to admin_podcast_episode_path(@episode), notice: "Episode updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @episode.destroy
    redirect_to admin_podcast_episodes_path, notice: "Episode deleted."
  end

  private

  def set_episode
    @episode = PodcastEpisode.find(params[:id])
  end

  def episode_params
    params.require(:podcast_episode).permit(:title, :description, :embed_url, :platform, :published_at)
  end
end
