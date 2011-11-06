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
        DistributionMail.mail_distribution(@distributions).deliver
        format.html { redirect_to(root_path, :notice => 'Ваш e-mail был удачно добавлен!') }
      else
        format.html { redirect_to(root_path, :notice => 'Вы ввели неверный числовой код! Повторите попытку.')  }
      end
    end

  end
end
