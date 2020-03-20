class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  # skip_before_action :authenticate_user!, only: %i[ofertas create]

  def ofertas
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.deliver
      flash[:notice] = 'Mensagem enviada com sucesso!'
      redirect_to ofertas_path
    else
      render :ofertas
    end
  end

  private

  def page_params
    params.require(:page).permit(:name, :email, :text)
  end
end
