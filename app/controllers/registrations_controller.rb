class RegistrationsController < Devise::RegistrationsController  
  def edit
    render_with_scope :edit
  end
end