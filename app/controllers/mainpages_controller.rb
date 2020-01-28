class MainpagesController < ApplicationController
  # before_action :set_mainpage, only: [:show, :edit, :update, :destroy]

  def index
    # @mainpages = Mainpage.all
  end

  def search
    widgets = find_widget(params[:widget])
    unless widgets
      flash[:alert] = 'Widget not found'
      return render action: :index
    end
    @widget = widgets.first
  end

  def show
    widget_images = show_widget(params[:widgetimg])
    @widgetimg = widget_images.first   
  end

  def show_widget(images)
    request_api(
      "https://showoff-rails-react-production.herokuapp.com/api/v1/widgets/visible?client_id=277ef29692f9a70d511415dc60592daf4cf2c6f6552d3e1b769924b2f2e2e6fe&client_secret=d6106f26e8ff5b749a606a1fba557f44eb3dca8f48596847770beb9b643ea352"
    )
  end

  # def new
  #   @mainpage = Mainpage.new
  # end

  # def edit
  # end

  # def create
  #   @mainpage = Mainpage.new(mainpage_params)

  #   respond_to do |format|
  #     if @mainpage.save
  #       format.html { redirect_to @mainpage, notice: 'Mainpage was successfully created.' }
  #       format.json { render :show, status: :created, location: @mainpage }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @mainpage.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def update
  #   respond_to do |format|
  #     if @mainpage.update(mainpage_params)
  #       format.html { redirect_to @mainpage, notice: 'Mainpage was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @mainpage }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @mainpage.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def destroy
  #   @mainpage.destroy
  #   respond_to do |format|
  #     format.html { redirect_to mainpages_url, notice: 'Mainpage was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    def request_api(url)
      response = Excon.get(
        url,
        headers: {
          'Authorization' => ENV.fetch('AUTHORIZATION')
        }
      )
      return nil if response.status != 200
      JSON.parse(response.body)
    end
    def find_widget(name)
      request_api(
        "https://showoff-rails-react-production.herokuapp.com/api/v1/#{URI.encode(name)}"
      )
    end
end
