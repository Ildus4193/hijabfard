# coding: utf-8
class DistributionsController < ApplicationController
  def new
    @distributions = Distribution.new
  end
  def create
    @distributions = Distribution.new(params[:distribution])
    respond_to do |format|
      if @distributions.valid_with_captcha?
        @distributions.save
        format.html { redirect_to(root_path, :notice => 'Рассылка отправлено.') }
      else
        format.html { redirect_to(root_path, :notice => 'Рассылка не отправлено.')  }
      end
    end

  end
end
